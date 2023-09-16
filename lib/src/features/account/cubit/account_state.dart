// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'account_bloc.dart';

class AccountState extends Equatable {
  final bool isLoading;
  final String token;
  final InfoAccountModel infoAccount;
  final String pathavatarImage;

  bool get accountNotExist => infoAccount.username.isEmpty;

  const AccountState({
    this.isLoading = true,
    this.token = "",
    required this.infoAccount,
    this.pathavatarImage = "",
  });

  factory AccountState.ds() => AccountState(
      isLoading: true,
      token: "",
      infoAccount: InfoAccountModel.empty(),
      pathavatarImage: UserPrefs().getAvatarUser);

  factory AccountState.empty() =>
      AccountState(token: "", infoAccount: InfoAccountModel.empty());

  @override
  List<Object?> get props => [
        isLoading,
        token,
        infoAccount,
        pathavatarImage,
      ];

  AccountState copyWith({
    bool? isLoading,
    String? token,
    InfoAccountModel? infoAccount,
    String? pathavatarImage,
  }) {
    return AccountState(
      isLoading: isLoading ?? this.isLoading,
      token: token ?? this.token,
      infoAccount: infoAccount ?? this.infoAccount,
      pathavatarImage: pathavatarImage ?? this.pathavatarImage,
    );
  }
}
