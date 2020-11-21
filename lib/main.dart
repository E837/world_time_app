import 'package:flutter/material.dart';
import 'package:world_time_app/pages/HomeScreen.dart';
import 'package:world_time_app/pages/Location.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('loading'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(
              'loading',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            SizedBox(height: 20,),
            RaisedButton(
              color: Colors.amber,
              child: Text(
                'test',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}
