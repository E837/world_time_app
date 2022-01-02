import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImage = data['isDayTime']? 'day.png': 'night.png';
    Color textColor = data['isDayTime']? Colors.black: Colors.white;
    double timeFontSize = 66;

    if (data['time'] == 'network error')
      timeFontSize = 40;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            FlatButton.icon(
              color: data['isDayTime']? Colors.yellow: Colors.lightBlue,
              label: Text(
                'choose location',
                style: TextStyle(
                  color: textColor,
                ),
              ),
              icon: Icon(
                Icons.location_on_rounded,
                color: textColor,
              ),
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/location');
                //why dynamic up here???
                setState(() {
                  data = {
                    'time': result['time'],
                    'location': result['location'],
                    'isDayTime': result['isDayTime'],
                    'flag': result['flag'],
                  };
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              data['location'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontSize: 40,
                color: textColor,
              ),
            ),
            SizedBox(height: 14,),
            Text(
              data['time'],
              style: TextStyle(
                fontSize: timeFontSize,
                fontWeight: FontWeight.bold,
                  color: textColor,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
