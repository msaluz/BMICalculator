import 'package:bmi_calculator/logic/cubits/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/color_styles.dart';
import '../../core/constants/strings.dart';
import '../router/routes.dart';
import '../widgets/drawer_widget.dart';

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
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Strings.title),
        backgroundColor: ColorStyles.darkPurple,
        elevation: 5,
      ),
      backgroundColor: ColorStyles.lightPurple,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          children: [
            const Text(Strings.welcomeText,
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
                    const Text(Strings.pleaseInsertUsername,
                        style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: Strings.insertUsername,
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
                    Navigator.of(context).pushNamed(Routes.bmiScreen),
                    controller.clear(),
                  ];
                } else {
                  _showEmptyUserDialog();
                }
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const BmiScreen(text: )))
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: const Size(150, 50),
                primary: ColorStyles.lightGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(Strings.btnContinue,
                style: TextStyle(
                    color: ColorStyles.darkPurple,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showEmptyUserDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(Strings.alertHey),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(Strings.alertDescription),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(Strings.alertApprove),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
