import 'package:bmi_calculator/core/constants/color_styles.dart';
import 'package:bmi_calculator/data/dataproviders/database/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/strings.dart';
import '../../data/models/bmi_model.dart';
import '../widgets/drawer_widget.dart';

class BmiHistory extends StatefulWidget {
  const BmiHistory({Key? key}) : super(key: key);

  @override
  State<BmiHistory> createState() => _BmiHistoryState();
}

class _BmiHistoryState extends State<BmiHistory>
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
      body: Center(
        child: FutureBuilder<List<BMI>>(
            future: DatabaseHelper.instance.getBmiResults(),
            builder: (BuildContext context, AsyncSnapshot<List<BMI>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: Text(Strings.loading,
                        style: TextStyle(color: Colors.white)));
              }
              return snapshot.data!.isEmpty
                  ? const Center(
                      child: Text(Strings.noBmiInList,
                          style: TextStyle(color: Colors.white)))
                  : Align(
                      alignment: Alignment.topCenter,
                      child: ListView(
                        reverse: true,
                        shrinkWrap: true,
                        children: snapshot.data!.map((bmi) {
                          return Center(
                            child: ListTile(
                              title: Text("Username: ${bmi.username}",
                                  style: const TextStyle(color: Colors.white)),
                              subtitle: Text(
                                  "Time: ${bmi.date}\nHeight: ${bmi.height}\nWeight: ${bmi.weight}\nBMI Score: ${bmi.score}\nBMI Rating: ${bmi.rating}",
                                  style: const TextStyle(color: Colors.white)),
                              onLongPress: () {
                                setState(() {
                                  DatabaseHelper.instance.remove(bmi.id!);
                                });
                              },
                            ),
                          );
                        }).toList(),
                      ));
            }),
      ),
    );
  }
}
