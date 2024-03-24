import 'package:bloom_buddy/layout/shop_app/shop_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'layout/plant_app/plant_layout.dart';
import 'modules/home/home_screen.dart';
import 'package:bloom_buddy/shared/shared.network/remote/dio_helper.dart';

import 'modules/shop_app/on_boarding/on_boarding_screen.dart';


void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.green,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
        ),
      ),
      home: OnBoardingScreen(),
    );
  }
}