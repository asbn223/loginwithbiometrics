import 'package:flutter/material.dart';
import 'package:letitgrow_login/models/doctor.dart';
import 'package:letitgrow_login/provider/dummy_data.dart';
import 'package:letitgrow_login/screens/home/doctor_card.dart';

class DoctorGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Doctor> _doctorList = DUMMYDATA.doctorList;
    Size size = MediaQuery.of(context).size;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: size.width / (size.height / 2.5),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 5,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        return DoctorCard(_doctorList[index]);
      },
      itemCount: _doctorList.length,
    );
  }
}
