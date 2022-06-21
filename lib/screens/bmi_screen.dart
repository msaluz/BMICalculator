import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          textDirection: TextDirection.ltr,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: const [
          TextField(
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              hintText: 'Enter Weight',
              contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20)
            ),
          )
        ],
      ),
    );
  }
}
