import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.green,
  bool isUpperCase = true,
  double radius = 10.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  required IconData? suffix,
  required VoidCallback suffixPressed,
  required String? Function(dynamic value) validator,
  required bool isPassword,
  required bool obscureText,
  required InputDecoration decoration,
  required void Function(dynamic value) onChange,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: obscureText,
      decoration: decoration.copyWith(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
      ),
      validator: validator,
      onChanged: onChange,
    );

Widget myDivider() => VerticalDivider(
  color: Colors.grey, // Customize the color of the divider
  thickness: 1, // Customize the thickness of the divider
  width: 20,
); // Customize the width of the divider

Widget buildArticleItems() => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Image.asset(
          'assets/images/flower.jpeg',
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        width: 20.0,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'sun flower',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      )
    ],
  ),
);

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
