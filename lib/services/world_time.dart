import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location;
  String url;
  String time;
  String flag;

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
      // print(now);
      time = now.toString();
    }
    catch (e) {
      print('the problem is: $e');
      time = 'network error';
    }
  }

}