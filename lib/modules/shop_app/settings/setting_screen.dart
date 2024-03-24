import 'package:bloom_buddy/layout/shop_app/shop_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  void navigateAndFinish(
      context, widget,) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => widget,
        ),
            (Route<dynamic> route) => false,
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting Screen',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Setting screen',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                navigateAndFinish(context, ShopLayout());
              },
              child: Text('Return'),
            ),
          ],
        ),
      ),
    );
  }
}
