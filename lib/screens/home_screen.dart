import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Color textColor = Colors.white;

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
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
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
                  children: const [
                    Text("Please insert your Username",
                        style: TextStyle(color: Colors.white)),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
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
                setState(() {});
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
