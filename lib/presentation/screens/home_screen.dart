import 'package:bmi_calculator/logic/cubits/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../router/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Color textColor = Colors.white;
TextEditingController controller = TextEditingController();

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI CALCULATOR"),
        backgroundColor: const Color(0xff140034),
        elevation: 5,
      ),
      backgroundColor: const Color(0x2f6009cb),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 75, 20, 20),
        child: Column(
          children: [
            const Text(
              "Welcome to our new App "
              "BMI Calculator"
              ". You will love it! You need to calculate your BMI anytime? No problem, just start right away! Please insert your username below to continue and click the button.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Align(
                child: Column(
                  children: [
                    const Text("Please insert your Username",
                        style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Insert Username',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (controller.text != "") {
                  [
                    context.read<UserCubit>().sendUsername(controller.text),
                    Navigator.of(context).pushNamed(Routes.bmiScreen)
                  ];
                } else {
                  //TODO: Show error message
                }
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const BmiScreen(text: )))
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: const Size(150, 50),
                primary: const Color(0xff26ff00),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(
                    color: Color(0xff140034),
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
