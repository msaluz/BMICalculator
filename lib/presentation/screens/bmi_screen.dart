import 'package:bmi_calculator/logic/cubits/bmi_cubit.dart';
import 'package:bmi_calculator/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        title: const Text("BMI CALCULATOR"),
        backgroundColor: const Color(0xff140034),
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
        padding: const EdgeInsets.all(20),
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
                      color: const Color(0x2f6009cb),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "HEIGHT",
                          style: TextStyle(
                              color: Color(0xffB2B9D5),
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
                              const TextSpan(
                                  text: 'CM',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        Slider(
                            inactiveColor: const Color(0xffB2B9D5),
                            activeColor: const Color(0xff00951a),
                            thumbColor: const Color(0xff26ff00),
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
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0x2f6009cb),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "WEIGHT",
                                style: TextStyle(
                                    color: Color(0xffB2B9D5),
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
                                const TextSpan(
                                    text: 'KG',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                              ])),
                              Slider(
                                  inactiveColor: const Color(0xffB2B9D5),
                                  activeColor: const Color(0xff00951a),
                                  thumbColor: const Color(0xff26ff00),
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
                      cubit.setBmiValues(height.toString(), weight.toString()),
                      cubit.bmiCalculate(height, weight),
                      cubit.bmiGetRating(height, weight),
                      Navigator.of(context).pushNamed(Routes.resultScreen)
                    ];
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: Size(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height),
                    primary: const Color(0xff26ff00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Check Your BMI",
                    style: TextStyle(
                        color: Color(0xff140034),
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xff140034),
    );
  }
}
