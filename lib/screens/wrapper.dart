import 'package:flutter/material.dart';
import 'package:kayoola_drivers_app/screens/home/home.dart';
import 'package:provider/provider.dart';
import '../models/theuser.dart';
import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context);
    //Return either home or authentication widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
