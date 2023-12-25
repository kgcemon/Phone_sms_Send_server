import 'dart:io';

class InternetChecker {

  Future<bool> internetConnect() async {
    try {
      var result = await InternetAddress.lookup("google.com");
      return true;
    } on SocketException {
      return false;
    } catch (e) {
      // Handle or log other exceptions if needed

      return false; // or throw e; depending on your use case
    }
  }

}
