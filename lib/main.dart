import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time_app/pages/HomeScreen.dart';
import 'package:world_time_app/pages/Location.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => HomeScreen(),
      '/location': (context) => Location(),
    },
  ));
}

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  int counter = 0;

  void setUpWorldTime() async {
    WorldTime instance = WorldTime(location:'Berlin', url:'Europe/berlin', flag:'berlin.png');
    await Future.delayed(Duration(seconds: 2));
    await instance.getData();
    // print(instance.time);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Loading'),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         SelectableText(
    //           'you tapped $counter times!',
    //           style: TextStyle(
    //             fontSize: 30,
    //           ),
    //         ),
    //         SizedBox(height: 20,),
    //         RaisedButton(
    //           color: Colors.red,
    //           child: Text(
    //             'count',
    //             style: TextStyle(
    //               color: Colors.white,
    //             ),
    //           ),
    //           onPressed: () {
    //             setState(() {
    //               counter++;
    //             });
    //           },
    //         ),
    //         SizedBox(height: 20,),
    //         RaisedButton(
    //           color: Colors.amber,
    //           child: Text(
    //             'test',
    //             style: TextStyle(
    //               color: Colors.white,
    //             ),
    //           ),
    //           onPressed: () {
    //             // Navigator.pushNamed(context, '/home');
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
