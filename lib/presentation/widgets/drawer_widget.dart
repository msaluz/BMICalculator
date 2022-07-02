import 'package:flutter/material.dart';

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
              text: "User",
              icon: Icons.people,
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              text: "Home",
              icon: Icons.cottage,
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              text: "Overview",
              icon: Icons.data_thresholding_outlined,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
  }) {
    const color = Colors.white;

    return ListTile(
        leading: Icon(icon,color: color),
        title: Text(text, style: const TextStyle(color: color)),
        onTap: () {}
    );
  }
}