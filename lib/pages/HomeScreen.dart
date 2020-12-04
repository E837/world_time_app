import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('test'),
          onPressed: () {
            Future.delayed(Duration(seconds: 3), () {
              Navigator.pushNamed(context, '/location');
            });
          },
        ),
      ),
    );
  }
}
