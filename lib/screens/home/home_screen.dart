import 'package:flutter/material.dart';
import 'package:letitgrow_login/screens/home/doctor_grid_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Let It Grow"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: size.height,
        width: double.infinity,
        child: DoctorGridView(),
      ),
    );
  }
}
