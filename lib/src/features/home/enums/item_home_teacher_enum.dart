import 'package:canteen/src/config/constants/images.dart';

import 'package:canteen/widgets/dialogs/toast_wrapper.dart';

enum ItemHomeTeacherEnum {
  calendar,
  workingSchedule,
  otherCalendar,
  mailboxSent,
  inbox,

  news;

  String get nameOf {
    switch (this) {
      case calendar:
        return "Lịch";
      case workingSchedule:
        return "Lịch công tác";
      case otherCalendar:
        return "Lịch khác";
      case mailboxSent:
        return "Hộp thư đã gửi";
      case inbox:
        return "Hộp thư đến";
      // case department:
      //   return "Đơn vị";
      case news:
        return "Thông báo chung";
      // case attendance:
      //   return "Tạo điểm danh";
    }
  }

  String get iconOf {
    switch (this) {
      case calendar:
        return XImage.calendarHome;
      case workingSchedule:
        return XImage.workingSchedule;
      case otherCalendar:
        return XImage.otherCalendar;
      case mailboxSent:
        return XImage.mailboxSent;
      case inbox:
        return XImage.inbox;
      // case department:
      //   return XImage.phoneBook;
      case news:
        return XImage.news;
      // case attendance:
      //   return XImage.attendance;
    }
  }

  Function() onTap() {
    switch (this) {
      case calendar:
        return () {};
      case workingSchedule:
        return () {};
      case otherCalendar:
        return () {};
      case mailboxSent:
        return () {};
      case inbox:
        return () {};

      case news:
        return () {};
    }
  }

  void onPressed() {
    XToast.show(
        "Chức năng đang được phát triển. Sẽ có sẵn trong phiên bản tiếp theo");
  }
}
