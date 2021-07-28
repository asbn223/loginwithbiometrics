import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:letitgrow_login/core/services/auth_services.dart';
import 'package:letitgrow_login/core/utils/validators.dart';
import 'package:letitgrow_login/screens/home/home_screen.dart';
import 'package:letitgrow_login/widgets/custom_button.dart';
import 'package:letitgrow_login/widgets/custom_snackbar.dart';
import 'package:letitgrow_login/widgets/custom_textfield.dart';

class LoginContainer extends StatefulWidget {
  bool isLogin, isRegister;
  final Function() onTap;
  LoginContainer({
    required this.isLogin,
    required this.isRegister,
    required this.onTap,
  });

  @override
  _LoginContainerState createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  String _email = "";
  String _password = "";
  final _formKey = GlobalKey<FormState>();

  ///FUNC [_saveForm] : Save form and validate email password
  void _saveForm() async {
    try {
      print(_email);
      User? user = await AuthService.login(_email, _password);
      if (user != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => HomeScreen(),
          ),
        );
      }
    } catch (error) {
      print(error);
      showCustomSnackBar(
        context,
        message: "Sorry, could not login! Invalid Credentials.",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: Duration(milliseconds: 500),
        height: widget.isLogin ? size.height * .8 : size.height * .2,
        color: Colors.blueAccent,
        child: widget.isLogin
            ? SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Please login to continue",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            labelText: "Email",
                            value: _email,
                            prefixIcon: Icons.email,
                            onSaved: (value) =>
                                _email = value.toString().trim(),
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                            textColor: Colors.white,
                            borderColor: Colors.white,
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            labelText: "Password",
                            isPassword: true,
                            isPasswordSeen: true,
                            value: _password,
                            prefixIcon: Icons.lock,
                            onSaved: (value) => _password = value.toString(),
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.text,
                            textColor: Colors.white,
                            borderColor: Colors.white,
                          ),
                          SizedBox(height: 14),
                          CustomButton(
                            onTap: _saveForm,
                            title: "Login",
                            color: Colors.white,
                            fontColor: Colors.blueAccent,
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () async {
                              final bool isAuthenticated =
                                  await AuthService.loginWithBiometrics();

                              if (isAuthenticated) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              "Login with Fingerprint",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "or",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Sign Up using",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          IconButton(
                            onPressed: () async {
                              User? user = await AuthService.signInWithGoogle(
                                  context: context);

                              if (user != null) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              }
                            },
                            icon: Icon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
      ),
    );
  }
}
