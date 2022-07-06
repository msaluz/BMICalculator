import 'package:bmi_calculator/logic/cubits/bmi_cubit.dart';
import 'package:bmi_calculator/logic/cubits/user_cubit.dart';
import 'package:bmi_calculator/presentation/router/app_router.dart';
import 'package:bmi_calculator/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/router/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(create: (context) => UserCubit()),
        BlocProvider<BmiCubit>(create: (context) => BmiCubit())
      ],
      child: MaterialApp(
        title: AppLocalizations.of(context)?.title ?? "",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('de', ''), // German, no country code
        ],
        initialRoute: Routes.homeScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
