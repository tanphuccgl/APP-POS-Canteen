import 'package:canteen/src/network/domain.dart';
import 'package:canteen/src/network/model/account/info_account_model.dart';
import 'package:canteen/src/router/coordinator.dart';
import 'package:canteen/src/services/user_prefs.dart';
import 'package:canteen/widgets/dialogs/toast_wrapper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

part 'account_state.dart';

class AccountBloc extends Cubit<AccountState> {
  AccountBloc() : super(AccountState.ds()) {
    init();
  }
  Domain get _domain => GetIt.I<Domain>();

  void init() async {
    //? wait for the splash screen to initialize
    await Future.delayed(const Duration(seconds: 2));

    _saveToken();
    await getInfoAccount(state.token);
    _emitIfOpen(state.copyWith(isLoading: false));
  }

  void _emitIfOpen(AccountState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }

  void _saveToken() {
    final token = UserPrefs().getTokenAccount;
    _emitIfOpen(state.copyWith(token: token));
  }

  Future<void> getInfoAccount(String token) async {
    if (token.isEmpty) return;
    final value = await _domain.userRepository.getInfoAccount(token);

    if (value.isSuccess) {
      _emitIfOpen(state.copyWith(infoAccount: value.data));
    } else {
      UserPrefs().setTokenAccount(null);
      _emitIfOpen(AccountState.empty());
      XToast.show("Phiên đăng nhập hết hạn");
    }
  }

  Future<void> _removeToken() async {
    final token = UserPrefs().getTokenAccount;
    if (token.isEmpty) return;
    _domain.userRepository.logout(token);
  }

  Future<void> logout() async {
    XToast.showLoading();
    await _removeToken();
    UserPrefs().setTokenAccount(null);
    UserPrefs().removeAvatarUser();
    _emitIfOpen(AccountState.empty());
    XToast.hideLoading();
    XCoordinator.logoutAndShowSignIn();
  }

  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
      if (photo != null) {
        emit(state.copyWith(pathavatarImage: photo.path));
        UserPrefs().saveAvatarUser(photo.path);
      } else {
        return;
      }
    } catch (e) {
      return;
    }
  }
}
