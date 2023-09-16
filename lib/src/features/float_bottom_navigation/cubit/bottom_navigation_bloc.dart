import 'package:canteen/src/config/constants/images.dart';
import 'package:canteen/src/features/home/router/home_wrapper_router.dart';
import 'package:canteen/src/features/profile/router/profile_wrapper_router.dart';
import 'package:canteen/src/theme/colors.dart';
import 'package:canteen/widgets/common/empty_widget.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationBloc extends Cubit<BottomNavigationState> {
  BottomNavigationBloc() : super(const BottomNavigationState());

  void onItemTapped(int index) =>
      _emitIfOpen(state.copyWith(pageIndex: PageIndex.values[index]));
  void _emitIfOpen(BottomNavigationState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
