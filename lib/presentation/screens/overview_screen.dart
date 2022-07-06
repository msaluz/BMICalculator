import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/constants/color_styles.dart';
import '../widgets/drawer_widget.dart';


class BmiOverviewScreen extends StatefulWidget {
  const BmiOverviewScreen({Key? key}) : super(key: key);

  @override
  State<BmiOverviewScreen> createState() => _BmiOverviewScreenState();
}

class _BmiOverviewScreenState extends State<BmiOverviewScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppLocalizations.of(context)!.title),
          backgroundColor: ColorStyles.darkPurple,
          elevation: 5,
        ),
        backgroundColor: ColorStyles.lightPurple,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorStyles.lightPurple,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppLocalizations.of(context)!.underweight,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.healthyWeight,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.overweight,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.obese,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ]),
          ),
        ));
  }
}
