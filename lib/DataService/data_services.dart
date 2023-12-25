import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sms/Models/sms_model.dart';

class DataServices {
  static Future<String> SendSmsServer(String sender, String fullsms) async {
    var response = await http
        .post(Uri.parse(""), body: {
      "sender": sender,
      "message": fullsms,
    });

    if (response.statusCode == 200) {
      var body = SmsModel.fromJson(jsonDecode(response.body));
      if (body.success == "true") {
        return "yes";
      }
    }
    return "no";
  }
}
