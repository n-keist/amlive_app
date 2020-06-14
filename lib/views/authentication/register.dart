import 'package:flutter/material.dart';

class AuthenticationViewRegister extends StatefulWidget {
  @override
  _AuthenticationViewRegisterState createState() =>
      _AuthenticationViewRegisterState();
}

class _AuthenticationViewRegisterState
    extends State<AuthenticationViewRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: '',
            ),
          ),
        ],
      ),
    );
  }
}
