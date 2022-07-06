import 'package:bmi_calculator/logic/cubits/user_cubit.dart';
import 'package:bmi_calculator/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/constants/color_styles.dart';
import '../../data/dataproviders/database/database_helper.dart';
import '../../data/models/bmi_model.dart';
import '../../logic/cubits/bmi_cubit.dart';
import '../widgets/drawer_widget.dart';


class BmiResultScreen extends StatefulWidget {
  const BmiResultScreen({Key? key}) : super(key: key);

  @override
  State<BmiResultScreen> createState() => _BmiResultScreenState();
}

class _BmiResultScreenState extends State<BmiResultScreen>
    with SingleTickerProviderStateMixin {

  String _username = "";
  int _height = 0;
  int _weight = 0;
  double _score = 0;
  String _rating = "";

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy kk:mm').format(now);
    return Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppLocalizations.of(context)!.title),
          backgroundColor: ColorStyles.darkPurple,
          elevation: 5,
          actions: [
            IconButton(
                onPressed: () async {
                  await DatabaseHelper.instance.add(
                    BMI.db(username: _username, height: _height, weight: _weight, score: _score, rating: _rating, date: formattedDate.toString()),
                  );
                  SchedulerBinding.instance.addPostFrameCallback((_) async {
                    Navigator.of(context).pushReplacementNamed(Routes.historyScreen);
                  });
                },
                icon: const Icon(Icons.save)
            ),
          ],
        ),
        backgroundColor: ColorStyles.lightPurple,
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
                            color: ColorStyles.lightPurple,
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.givenData,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                BlocBuilder<UserCubit, UserState>(
                                  builder: (context, state) {
                                    final userData =
                                        state.username;
                                    _username = userData;
                                    return Text(
                                      "User: $userData",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    );
                                  },
                                ),
                                BlocBuilder<BmiCubit, BmiState>(
                                  builder: (context, state) {
                                    final heightData =
                                        (state as BmiResult).height;
                                    _height = int.parse(heightData);
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
                                    _weight = int.parse(weightData);
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
                            color: ColorStyles.lightPurple,
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
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
                                    _score = double.parse(scoreData);
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
                                    _rating = ratingData;
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
