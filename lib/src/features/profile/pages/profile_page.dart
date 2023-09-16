import 'package:canteen/src/features/profile/widgets/body_profile.dart';
import 'package:canteen/src/features/profile/widgets/header_profile.dart';
import 'package:canteen/src/theme/colors.dart';
import 'package:canteen/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(children: [GapHelper.h120, const BodyProfile()]),
        const HeaderProfile(),
      ]),
      backgroundColor: XColors.bgScreen,
    );
  }
}
