import 'package:bmi_calculator/data/dataproviders/database/database_helper.dart';
import 'package:flutter/material.dart';

import '../../data/models/bmi_model.dart';
import '../widgets/drawer_widget.dart';

class BmiHistory extends StatelessWidget {
  const BmiHistory({Key? key}) : super(key: key);

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
      body: Center(
        child: FutureBuilder<List<BMI>>(
            future: DatabaseHelper.instance.getBmiResults(),
            builder: (BuildContext context, AsyncSnapshot<List<BMI>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: Text('Loading...'));
              }
              return snapshot.data!.isEmpty
                ? const Center(child: Text('No BMI records in List.'))
                : ListView(
                children: snapshot.data!.map((bmi) {
                  return Center(
                    child: ListTile(
                      title: Text(bmi.username),
                      onLongPress: () {
                        setState(bmi);
                      },
                    ),
                  );
                }).toList(),
              );
            }),
      ),
    );
  }

  void setState(BMI bmi) {
    DatabaseHelper.instance.remove(bmi.id!);
  }
}
