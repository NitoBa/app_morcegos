import 'package:App_Morcegos/app/pages/AboutPage/about.dart';
import 'package:App_Morcegos/app/pages/OnboardingPage/onboarding.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Morcegos-PI',
      theme: ThemeData(
          fontFamily: 'Calibre',
          primarySwatch: Colors.blue,
          canvasColor: Colors.transparent),
      home: Splash(),
      routes: {
        //'batpage': (context) => Batpage(),
        'aboutpage': (context) => AboutPage(),
      },
    );
  }
}
