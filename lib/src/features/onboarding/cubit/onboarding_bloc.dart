import 'package:canteen/src/router/router_name.dart';
import 'package:canteen/src/services/user_prefs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingBloc extends Cubit<OnboardingState> {
  OnboardingBloc() : super(const OnboardingState());

  PageController controller = PageController(initialPage: 0);

  void _navigateToSignInPage(BuildContext context) {
    UserPrefs().setViewedOnboarding();
    Navigator.pushReplacementNamed(context, XRouterName.signIn);
  }

  void onSkipButton(BuildContext context) => _navigateToSignInPage(context);

  void onContinueButton() {
    _emitIfOpen(state.copyWith(currentPage: state.currentPage + 1));
    controller.animateToPage(
      state.currentPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void onStartButton(BuildContext context) => _navigateToSignInPage(context);
  void _emitIfOpen(OnboardingState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
