import 'package:flutter/material.dart';
import 'package:kayoola_drivers_app/screens/home/home.dart';

class driver extends StatefulWidget {
  const driver({super.key});

  @override
  State<driver> createState() => _driverState();
}

class _driverState extends State<driver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'DriverStatistics',
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
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/driver.png'),
                  radius: 90,
                ),
              ),
              Divider(
                height: 70,
                color: Colors.black,
              ),
              Text(
                "TRIPS TAKEN",
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
                '7',
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
                "HOURS DRIVEN",
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
                '4h 36min',
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
                "DISTANCE COVERED",
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
                '34.6km',
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
