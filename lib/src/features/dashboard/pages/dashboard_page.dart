import 'package:canteen/src/features/float_bottom_navigation/cubit/bottom_navigation_bloc.dart';
import 'package:canteen/src/features/float_bottom_navigation/pages/float_bottom_navigation.dart';
import 'package:canteen/src/features/home/router/home_router.dart';

import 'package:canteen/src/features/profile/router/profile_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => HomeCoordinator()),
        RepositoryProvider(create: (_) => ProfileCoordinator()),
      ],
      child: BlocProvider(
        create: (_) => BottomNavigationBloc(),
        child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (_, state) {
            return WillPopScope(
              onWillPop: () async => false,
              child: Stack(children: [
                Scaffold(
                  body: state.pageIndex.page,
                  bottomNavigationBar: const FloatBottomNavigation(),
                ),
              ]),
            );
          },
          buildWhen: (p, c) => p.pageIndex != c.pageIndex,
        ),
      ),
    );
  }
}
