import 'package:flutter/material.dart';
import 'package:letitgrow_login/models/doctor.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  DoctorCard(this.doctor);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.95),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: "tag${doctor.id}",
            child: CircleAvatar(
              backgroundImage: NetworkImage(doctor.image),
            ),
          ),
          SizedBox(height: 20),
          Text(
            doctor.name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Cardiologist",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
