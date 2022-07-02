import 'package:bmi_calculator/logic/cubits/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubits/bmi_cubit.dart';
import '../widgets/drawer_widget.dart';

class BmiResultScreen extends StatefulWidget {
  const BmiResultScreen({Key? key}) : super(key: key);

  @override
  State<BmiResultScreen> createState() => _BmiResultScreenState();
}

class _BmiResultScreenState extends State<BmiResultScreen>
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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 50),
                  Expanded(
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0x2f6009cb),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Your given Data:",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "User: ${context.select((UserCubit userCubit) => userCubit.state.username)}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                BlocBuilder<BmiCubit, BmiState>(
                                  builder: (context, state) {
                                    final heightData =
                                        (state as BmiResult).height;
                                    if (state is BmiLoading) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    } else {
                                      return Text(
                                        "Height: $heightData",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      );
                                    }
                                  },
                                ),
                                BlocBuilder<BmiCubit, BmiState>(
                                  builder: (context, state) {
                                    final weightData =
                                        (state as BmiResult).weight;
                                    if (state is BmiLoading) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    } else {
                                      return Text(
                                        "Weight: $weightData",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ]))),
                  const SizedBox(height: 20),
                  Expanded(
                      child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0x2f6009cb),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Result:",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                BlocBuilder<BmiCubit, BmiState>(
                                  builder: (context, state) {
                                    final scoreData =
                                        (state as BmiResult).bmiScore;
                                    if (state is BmiLoading) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    } else {
                                      return Text(
                                        "BMI Score: $scoreData",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      );
                                    }
                                  },
                                ),
                                BlocBuilder<BmiCubit, BmiState>(
                                  builder: (context, state) {
                                    final ratingData =
                                        (state as BmiResult).bmiRating;
                                    return Text(
                                      "BMI Rating: $ratingData",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    );
                                  },
                                ),
                              ]))),
                  const SizedBox(height: 150),
                ])));
  }
}
