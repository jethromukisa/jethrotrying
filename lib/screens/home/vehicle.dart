import 'package:flutter/material.dart';

import 'home.dart';

class vehicle extends StatefulWidget {

  @override
  State<vehicle> createState() => _vehicleState();
}

class _vehicleState extends State<vehicle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'VehicleStatistics',
          style: TextStyle(color: Colors.black,
            fontSize: 22,
            fontFamily: 'Belanosima',
          ),
        ),
        backgroundColor: Colors.yellow,
        actions: <Widget>[
          TextButton.icon(
              icon: Icon(Icons.home_outlined,
                color: Colors.black,
              ),
              label: Text('home',
                style: TextStyle(color: Colors.black,
                  fontSize: 19,
                  fontFamily: 'Belanosima',
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              }
          )],
      ),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/bus.png'),
            Divider(
              height: 70,
              color: Colors.black,
            ),
            Text(
              "BATTERY PERCENTAGE",
              style: TextStyle(
                letterSpacing: 2,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '47%',
              style: TextStyle(
                letterSpacing: 2,
                color: Colors.yellow,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "BATTERY TIME LEFT",
              style: TextStyle(
                letterSpacing: 2,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '1h 18min',
              style: TextStyle(
                letterSpacing: 2,
                color: Colors.yellow,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "NEAREST CHARGING STATION",
              style: TextStyle(
                letterSpacing: 2,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '7.9km',
              style: TextStyle(
                letterSpacing: 2,
                color: Colors.yellow,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
