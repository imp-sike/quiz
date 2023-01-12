import 'dart:convert';
import 'package:http/http.dart' as http;

const String _fcmUrl = 'https://fcm.googleapis.com/fcm/send';
final Map<String, String> _headers = {
  'Content-Type': 'application/json',
  'Authorization':
      'key=AAAAaOvjmwo:APA91bFG0gP_6fj2chXT0AL0Yh-BRBEtjunt0fR-FdcxKoRX-IfHDv9g7IPX4WVMEPnjlS_XMuLsWBjpRWAZofjnuBI19TCo7sBiCV0jDtHBoodqppb4DbioKvtPXG3hfWFrXaVNZWI1'
};

class NotificationService {
  Future<bool> sendNotification(
      {String? title,
      String? text,
      Map<String, dynamic>? data,
      String? topic}) async {
    var body = {
      "notification": {
        "title": title,
        "text": text,
        "click_action": 'OPEN_ACTIVITY_1'
      },
      "data": data,
      "to": topic
    };

    var req = http.Request('POST', Uri.parse(_fcmUrl));
    req.headers.addAll(_headers);
    req.body = json.encode(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return true;
    } else {
      return false;
    }
  }
}
