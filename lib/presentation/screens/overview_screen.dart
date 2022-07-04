import 'package:bmi_calculator/core/constants/rating_descriptions.dart';
import 'package:flutter/material.dart';
import '../../core/constants/strings.dart';
import '../../core/constants/color_styles.dart';
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
          title: const Text(Strings.title),
          backgroundColor: ColorStyles.darkPurple,
          elevation: 5,
        ),
        backgroundColor: ColorStyles.lightPurple,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorStyles.lightPurple,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text(
                    RatingDescriptions.underweight,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    RatingDescriptions.healthyWeight,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    RatingDescriptions.overweight,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    RatingDescriptions.obese,
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
