import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_on/firebase_options.dart';
import 'package:todo_on/home.dart';
import 'package:todo_on/providers/locale_provider.dart';
import 'package:todo_on/providers/my_provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LocaleProvider()),
          ChangeNotifierProvider(create: (context) => MyProvider()),
        ],
        child: MyApp(),
      ),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var localeProvider = Provider.of<LocaleProvider>(context);
    final pro =Provider.of<MyProvider>(context);
    return MaterialApp(
      theme: pro.themeData,
      darkTheme: pro.darkTheme,
      themeMode: pro.themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute:Home.routeName,
      routes: {
        Home.routeName:(context)=> Home(),
      },
      debugShowCheckedModeBanner: false,

    );
  }
}