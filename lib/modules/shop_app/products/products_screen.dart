import 'package:flutter/cupertino.dart';

class ProductsScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: Text(
        'Products Screen',
        style: TextStyle(
          fontSize:20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

  }
}