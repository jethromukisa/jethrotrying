import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kayoola_drivers_app/screens/home/driver.dart';
import 'package:kayoola_drivers_app/screens/home/vehicle.dart';
import '../../services/auth.dart';
import '../../services/databases.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService(uid: '').drivers,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'KayoolaDriversApp',
            style: TextStyle(color: Colors.black,
                fontSize: 22,
                fontFamily: 'Belanosima'),
          ),
          backgroundColor: Colors.yellow,
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: Text(
                'log out',
                style: TextStyle(color: Colors.black,
                  fontSize: 17,
                  fontFamily: 'Belanosima',
                ),
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/logo.png'),
              Divider(
                height: 80,
                color: Colors.black,
              ),
              Text(
                "DRIVER'S NAME",
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
                'Karen Dorcas',
                style: TextStyle(
                  letterSpacing: 2,
                  color: Colors.yellow,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                child: const Text(
                  'DRIVER STATISTICS',
                  style: TextStyle(color: Colors.black,
                      ),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.yellow),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => driver(),
                      ));
                },
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'VEHICLE NUMBER PLATE',
                style: TextStyle(
                  letterSpacing: 2,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'UZZ 999Z',
                style: TextStyle(
                  letterSpacing: 2,
                  color: Colors.yellow,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                child: const Text(
                  'VEHICLE STATISTICS',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.yellow),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => vehicle(),
                      ));
                },
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
