import 'dart:io';

import 'package:canteen/src/config/constants/images.dart';
import 'package:canteen/src/features/account/cubit/account_bloc.dart';
import 'package:canteen/src/theme/colors.dart';
import 'package:canteen/src/utils/helper/gap.dart';
import 'package:canteen/src/utils/helper/radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final accountState = GetIt.I<AccountBloc>().state;
    final user = accountState.infoAccount;

    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state1) {
        return Padding(
            padding: EdgeInsets.fromLTRB(25.w, 80.h, 20.w, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: GestureDetector(
                      onTap: () => context.read<AccountBloc>().pickImage(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(File(state1.pathavatarImage),
                            errorBuilder: (context, error, stackTrace) {
                          return GestureDetector(
                              onTap: () =>
                                  context.read<AccountBloc>().pickImage(),
                              child: Image.asset(XImage.avatar,
                                  height: 80, fit: BoxFit.fill));
                        }, height: 80, fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 25.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderHelper.r20,
                          boxShadow: [
                            BoxShadow(
                                color: XColors.bgScreen.withOpacity(0.2),
                                offset: const Offset(0, 4),
                                blurRadius: 5)
                          ]),
                      width: 230.w,
                      height: 80.h,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${user.lastAndMiddleName} ${user.firstName}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2),
                            GapHelper.h4,
                            const Text("",
                                style: TextStyle(
                                    color: XColors.text,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500))
                          ]))
                ]));
      },
    );
  }
}
