import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letitgrow_login/core/services/auth_services.dart';
import 'package:letitgrow_login/core/utils/validators.dart';
import 'package:letitgrow_login/screens/home/home_screen.dart';
import 'package:letitgrow_login/widgets/custom_button.dart';
import 'package:letitgrow_login/widgets/custom_snackbar.dart';
import 'package:letitgrow_login/widgets/custom_textfield.dart';

class RegisterContainer extends StatefulWidget {
  bool isLogin, isRegister;
  final Function() onTap;
  RegisterContainer({
    required this.isLogin,
    required this.isRegister,
    required this.onTap,
  });

  @override
  _RegisterContainerState createState() => _RegisterContainerState();
}

class _RegisterContainerState extends State<RegisterContainer> {
  String _email = "";
  String _password = "";
  final _formKey = GlobalKey<FormState>();

  ///FUNC [_saveForm] : Save form and validate email password
  void _saveForm() async {
    try {
      print(_email);
      User? user = await AuthService.register(_email, _password);
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
        height: widget.isRegister ? size.height * .8 : size.height * .2,
        color: Colors.white,
        child: widget.isRegister
            ? SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create New Account",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueAccent,
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
                          ),
                          SizedBox(height: 14),
                          CustomButton(
                            onTap: _saveForm,
                            title: "Register",
                            color: Colors.blueAccent,
                            fontColor: Colors.white,
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
      ),
    );
  }
}
