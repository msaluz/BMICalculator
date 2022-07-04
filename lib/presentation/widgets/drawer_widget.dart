import 'package:bmi_calculator/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import '../../core/constants/strings.dart';


class NavigationDrawer extends StatelessWidget {
  final _padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color(0xff140034),
        child: ListView(
          padding: _padding,
          children: <Widget>[
            const SizedBox(height: 50),
            buildMenuItem(
              text: Strings.home,
              icon: Icons.cottage,
              onClicked: () => selectedItem(context,0),
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              text: Strings.ratingOverview,
              icon: Icons.article,
              onClicked: () => selectedItem(context,1),
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              text: Strings.history,
              icon: Icons.archive,
              onClicked: () => selectedItem(context,2),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;

    return ListTile(
      leading: Icon(icon,color: color),
      title: Text(text, style: const TextStyle(color: color)),
      onTap: onClicked,
    );


  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed(Routes.homeScreen);
        break;
      case 1:
        Navigator.of(context).pushNamed(Routes.overviewScreen);
        break;
      case 2:
        Navigator.of(context).pushNamed(Routes.historyScreen);
        break;
    }
  }
}