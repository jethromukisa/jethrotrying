import 'package:flutter/material.dart';
import '../../services/auth.dart';
import '../../shared/constants.dart';
import '../../shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'KayoolaDriversApp',
                style: TextStyle(fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                    fontFamily: 'Belanosima' ),
              ),
              SizedBox(height: 20),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val!.isEmpty ? 'Enter an email':null,
                  onChanged: (val) {
                    setState(() => email = val);
                  }
              ),
              SizedBox(height: 20),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars long':null,
                  onChanged: (val) {
                    setState(() => password = val);
                  }
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.black,),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.yellow),
                  onPressed: () async{
                    if (_formKey.currentState!.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.registerwithEmailandPassword(email, password);
                      if (result == null){
                        setState(() {
                          error = 'Please enter a valid email';});
                        loading = false;}
                    }
                  }
              ),
              SizedBox(height: 12),


              Text(
                error,
                style: TextStyle(
                    color:Colors.yellow,
                    fontSize: 14),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:"Already have an account, ",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold ,color: Colors.yellow),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: GestureDetector(
                        onTap: () {
                          // Handle button press
                          widget.toggleView();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),

                          child: Text(
                            'log in',
                            style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
