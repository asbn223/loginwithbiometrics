import 'package:flutter/material.dart';
import 'package:letitgrow_login/screens/auth/login_container.dart';
import 'package:letitgrow_login/screens/auth/register_container.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool login = true;

  bool register = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginContainer(
                isLogin: login,
                isRegister: register,
                onTap: () {
                  setState(() {
                    login = true;
                    register = false;
                  });
                },
              ),
              RegisterContainer(
                isLogin: login,
                isRegister: register,
                onTap: () {
                  setState(() {
                    login = false;
                    register = true;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
