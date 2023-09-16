import 'package:canteen/src/features/account/cubit/account_bloc.dart';
import 'package:canteen/src/features/loading/loading_page.dart';
import 'package:canteen/src/router/coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountBloc, AccountState>(
      listener: (_, state) {
        if (!state.isLoading) {
          state.token.isEmpty || state.accountNotExist
              ? XCoordinator.showSignIn()
              : XCoordinator.showDashboard();
        }
      },
      listenWhen: (p, c) =>
          p.isLoading != c.isLoading ||
          p.token != c.token ||
          p.accountNotExist != c.accountNotExist,
      child: const LoadingPage(),
    );
  }
}
