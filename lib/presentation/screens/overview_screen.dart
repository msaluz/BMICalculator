import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';


class BmiOverviewScreen extends StatefulWidget {
  const BmiOverviewScreen({Key? key}) : super(key: key);

  @override
  State<BmiOverviewScreen> createState() => _BmiOverviewScreenState();
}

class _BmiOverviewScreenState extends State<BmiOverviewScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("BMI CALCULATOR"),
          backgroundColor: const Color(0xff140034),
          elevation: 5,
        ),
        backgroundColor: const Color(0x2f6009cb),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0x2f6009cb),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text(
                    "BMI under 18.5:\n Underweight\nYour Weight is too low eat some health food.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "BMI between 18.5 and 24.9:\n Healthy Weight\nYou have a healthy body weight, good job.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "BMI between 25.0 and 29.9:\n Overweight\nYour body id overweight keep doing workout.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "BMI over 30:\n Obesity\nYour weight is too heavy go to GYM.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ]),
          ),
        ));
  }
}
