
import 'package:bloom_buddy/modules/add_cart/add_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'modules/home/home_screen.dart';
import 'package:bloom_buddy/shared/shared.network/remote/dio_helper.dart';

import 'modules/on_boarding/on_boarding_screen.dart';


void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddToCartScreen(),
    );
  }
}