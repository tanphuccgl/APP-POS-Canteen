import 'package:canteen/src/theme/colors.dart';
import 'package:canteen/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter/material.dart';

class XIconNotificationButton extends StatelessWidget {
  const XIconNotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      constraints: const BoxConstraints(maxWidth: 60, maxHeight: 60),
      child: IconButton(
        onPressed: () => onPressed(),
        icon: const Icon(
          Icons.notifications_none,
          size: 27,
          weight: 2,
          color: XColors.notification,
        ),
      ),
    );
  }

  void onPressed() {
    XToast.show(
        "Chức năng đang được phát triển. Sẽ có sẵn trong phiên bản tiếp theo");
  }
}
