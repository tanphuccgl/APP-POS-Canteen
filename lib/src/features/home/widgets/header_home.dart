import 'dart:io';

import 'package:canteen/src/config/constants/images.dart';
import 'package:canteen/src/features/account/cubit/account_bloc.dart';
import 'package:canteen/src/utils/helper/gap.dart';
import 'package:canteen/src/utils/helper/radius.dart';
import 'package:canteen/widgets/button/ic_notfication_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    final user = GetIt.I<AccountBloc>().state.infoAccount;
    String combinedText =
        (user.lastAndMiddleName ?? "") + (user.firstName ?? "");

    bool isTooLong = combinedText.length > 19;

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 25),
      child: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state1) {
          return Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderHelper.r20,
                ),
                width: 250.w,
                height: 85.h,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  CircleAvatar(
                    radius: 30,
                    child: GestureDetector(
                      onTap: () => context.read<AccountBloc>().pickImage(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(File(state1.pathavatarImage),
                            errorBuilder: (context, error, stackTrace) {
                          return GestureDetector(
                              onTap: () =>
                                  context.read<AccountBloc>().pickImage(),
                              child: Image.asset(XImage.avatar));
                        }, height: 60, fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  GapHelper.w12,
                  isTooLong
                      ? Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Flexible(
                                flex: 3,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Xin chào',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.41,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "${user.lastAndMiddleName ?? ""} ${user.firstName ?? ""}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.41,
                                          height: 1.5),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Xin chào',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.41,
                                height: 1.5,
                              ),
                            ),
                            Text(
                              "${user.lastAndMiddleName ?? ""} ${user.firstName ?? ""}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.41,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                ]),
              ),
              GapHelper.w24,
              const XIconNotificationButton(),
            ],
          );
        },
      ),
    );
  }
}
