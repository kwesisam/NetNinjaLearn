import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDayTime;

  WorldTime({required this.location, required this.url, required this.flag});

  Future<void> getTime() async {
    // make the request
    try {
      var response = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        DateTime now = DateTime.parse(data['utc_datetime']);
        isDayTime = now.hour < 6 && now.hour > 18 ? true : false;
        time = DateFormat.jm().format(now);
      }
    } catch (e) {
      print(e);
      time = "could not get time";
    }
  }
}
