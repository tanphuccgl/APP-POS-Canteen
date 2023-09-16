import 'package:canteen/src/features/home/enums/item_home_teacher_enum.dart';
import 'package:canteen/src/features/home/widgets/dash_line.dart';
import 'package:canteen/src/theme/colors.dart';
import 'package:canteen/src/utils/helper/gap.dart';
import 'package:canteen/src/utils/helper/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(
          15.w,
          30.h,
          15.w,
          20.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 30,
            childAspectRatio: XScreen.hasBottomNotch(context) ? 1.6.h : 0.7.h,
            children: ItemHomeTeacherEnum.values
                .map((e) => _buildItem(
                      icon: e.iconOf,
                      label: e.nameOf,
                      onTap: e.onTap(),
                    ))
                .toList()),
      ),
    );
  }

  Widget _buildItem({
    VoidCallback? onTap,
    required String icon,
    required String label,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Center(
            child: Column(
              children: [
                GapHelper.h4,
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xffCFF4D2).withOpacity(0.5),
                          const Color(0xff7BE495).withOpacity(0.4),
                        ],
                      ),
                    ),
                    width: 60,
                    height: 60,
                    child: Image.asset(icon, color: XColors.primary),
                  ),
                ),
                GapHelper.h12,
                Text(
                  label,
                  style: const TextStyle(
                    color: XColors.text,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                const Spacer(),
                CustomPaint(
                  painter: DashedLinePainter(),
                  size: const Size(90, 2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
