import 'package:canteen/src/features/profile/router/profile_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileWrapperPage extends StatelessWidget {
  const ProfileWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: (_) => context.read<ProfileCoordinator>(),
      child: context.read<ProfileCoordinator>().getNavigator(),
    );
  }
}
