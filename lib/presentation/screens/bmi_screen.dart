import 'package:bmi_calculator/logic/cubits/bmi_cubit.dart';
import 'package:bmi_calculator/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/constants/color_styles.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen>
    with SingleTickerProviderStateMixin {
  //variables
  late AnimationController controller;
  double height = 50;
  double weight = 0;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: -1,
      upperBound: 0,
    );
    controller.animateTo(0,
        curve: Curves.easeOut, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.title),
        backgroundColor: ColorStyles.darkPurple,
        elevation: 5,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  height = 50;
                  weight = 0;
                });
              },
              icon: const Icon(Icons.refresh_rounded)),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (BuildContext context, Widget? child) {
                      return Transform.translate(
                        offset: Offset(controller.value * 200, 0),
                        child: child,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (BuildContext context, Widget? child) {
                      return Transform.translate(
                        offset: Offset(controller.value * -200, 0),
                        child: child,
                      );
                    },
                  ),
                ),
              ],
            )),
            Expanded(
                flex: 10,
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, Widget? child) {
                    return Transform.translate(
                      offset: Offset(controller.value * -200, 0),
                      child: child,
                    );
                  },
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
                          AppLocalizations.of(context)!.height,
                          style: const TextStyle(
                              color: ColorStyles.whitePurple,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: height.toInt().toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 60,
                                      fontWeight: FontWeight.w500)),
                              TextSpan(
                                  text: AppLocalizations.of(context)!.heightUnit,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        Slider(
                            inactiveColor: ColorStyles.whitePurple,
                            activeColor: ColorStyles.darkGreen,
                            thumbColor: ColorStyles.lightGreen,
                            min: 50,
                            max: 250,
                            value: height,
                            onChanged: (val) {
                              setState(() {
                                height = val;
                              });
                            }),
                      ],
                    ),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: (context, Widget? child) {
                          return Transform.translate(
                            offset: Offset(controller.value * 200, 0),
                            child: child,
                          );
                        },
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
                                AppLocalizations.of(context)!.weight,
                                style: const TextStyle(
                                    color: ColorStyles.whitePurple,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              RichText(
                                  text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: weight.toInt().toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 60,
                                        fontWeight: FontWeight.w500)),
                                TextSpan(
                                    text: AppLocalizations.of(context)!.weightUnit,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                              ])),
                              Slider(
                                  inactiveColor: ColorStyles.whitePurple,
                                  activeColor: ColorStyles.darkGreen,
                                  thumbColor: ColorStyles.lightGreen,
                                  min: 0,
                                  max: 300,
                                  value: weight,
                                  onChanged: (val) {
                                    setState(() {
                                      weight = val;
                                    });
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 4,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, Widget? child) {
                  return Transform.translate(
                    offset: Offset(0, controller.value * -100),
                    child: child,
                  );
                },
                child: ElevatedButton(
                  onPressed: () {
                    final cubit = BlocProvider.of<BmiCubit>(context);
                    [
                      cubit.bmiResult(height.toInt(), weight.toInt()),
                      Navigator.of(context).pushNamed(Routes.resultScreen)
                    ];
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: Size(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height),
                    primary: ColorStyles.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.btnCheck,
                    style: const TextStyle(
                        color: ColorStyles.darkPurple,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: ColorStyles.darkPurple,
    );
  }
}
