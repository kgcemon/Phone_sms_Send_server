import 'package:permission_handler/permission_handler.dart';

abstract class MyPermission {
  static Future<bool> getSmsPermission() async {
    if (await Permission.sms.status == PermissionStatus.granted) {
      return true;
    } else {
      if (await Permission.sms.request() == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }
}
