import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String url;
  String time;
  String flag;
  bool isDayTime = true;// if network failed so it can run with a default value(null safety)

  WorldTime ({this.location, this.url, this.flag});

  Future<void> getData() async{
    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      // print(response.body);
      Map data = jsonDecode(response.body);
      // print(data);
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(dateTime);
      // print(offset);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 6 && now.hour < 20? true : false;
      //simplified=> isDayTime = now.hour > 6 && now.hour < 20;
      //because the right side of the equation returns true or false by itself

      time = DateFormat.jm().format(now);
      // print(now);
    }
    catch (e) {
      print('the problem is: $e');
      time = 'network error';
    }
  }

}