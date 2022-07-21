import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';


class WorldTime {
    String location = "";
    String time = "";
    String flag = "";
    String url = "";
    bool isDaytime = false;

    WorldTime({required this.location, required this.flag, required this.url});

    Future<void> getTime() async {
      try {
        Response responses = await get(
            Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
        Map data = jsonDecode(responses.body);
        // print(data);

        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(1, 3);
        // print(datetime);
        // print(offset);

        //  create Datetime object
        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));
        // print(now);

        isDaytime =  now.hour > 6 && now.hour < 20 ? true : false;

        time = DateFormat.jm().format(now);
      }
      catch (e) {
          print('caught the error: $e');
          time = 'could not get time data';
      }
    }
}

// WorldTime instance = WorldTime(location: 'Lagos', flag: 'nigeria.png', url: 'Africa/Lagos' );