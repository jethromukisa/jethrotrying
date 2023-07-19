import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kayoola_drivers_app/screens/wrapper.dart';
import 'package:kayoola_drivers_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'models/theuser.dart';

void main()   async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      catchError: (_, __) => null,
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );

  }
}