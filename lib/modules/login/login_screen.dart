import 'package:flutter/material.dart';

import '../../layout/layout_app/bloom_layout.dart';
import '../register/register_screen.dart';

class ShopLoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ShopLoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (Route<dynamic> route) => false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
      // Background image
      Positioned.fill(
      child: Image.asset(
        'assets/images/new2.jpg', // Provide your image path here
        fit: BoxFit.cover,
      ),
    ),
    Padding(
    padding: const EdgeInsets.all(20.0),
    child: Center(
    child: SingleChildScrollView(
    child: Form(
    key: formKey,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    SizedBox(
    height: MediaQuery.of(context).size.height * 0.2),
    // Adjust the height as needed
    Text(
    'Login',
    style: TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    ),
    ),
    SizedBox(
    height: 30.0,
    ),
    TextFormField(
    controller: emailController,
    keyboardType: TextInputType.emailAddress,
    validator: (value) {
    if (value!.isEmpty) {
    return 'Email address must not be empty';
    }
    if (!value.contains('@')) {
    return 'Email address must contain the @ sign';
    }
    return null;
    },
    decoration: InputDecoration(
    labelText: 'Email Address',
    prefixIcon: Icon(
    Icons.email,
    color: Colors.white,
    ),
    border: OutlineInputBorder(),
    fillColor: Colors.white.withOpacity(0),
    labelStyle: TextStyle(color: Colors.white),
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    ),
    ),
    style: TextStyle(color: Colors.white),
    ),
    SizedBox(
    height: 15.0,
    ),
    TextFormField(
    controller: passwordController,
    keyboardType: TextInputType.visiblePassword,
    obscureText: isPassword,
    validator: (value) {
    if (value!.isEmpty) {
    return 'Password must not be empty';
    }
    return null;
    },
    decoration: InputDecoration(
    labelText: 'Password',
    prefixIcon: Icon(Icons.lock,
      color: Colors.white,
    ),
      suffixIcon: IconButton(
        icon: Icon(
          isPassword
              ? Icons.visibility
              : Icons.visibility_off,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            isPassword = !isPassword;
          });
        },
      ),
      border: OutlineInputBorder(),
      fillColor: Colors.white.withOpacity(0),
      labelStyle: TextStyle(color: Colors.white),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
      style: TextStyle(color: Colors.white),
    ),
      SizedBox(
        height: 15.0,
      ),
      Container(
        width: double.infinity,
        color: Colors.green[900],
        child: MaterialButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              // Form validation successful
              print(emailController.text);
              print(passwordController.text);
              navigateAndFinish(context, AppLayout());
            }
          },
          child: Text('LOGIN',
              style: TextStyle(color: Colors.white)),
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account?',
            style: TextStyle(color: Colors.white),
          ),
          TextButton(
            onPressed: () {
              navigateAndFinish(context, RegisterScreen());
            },
            child: Text('Sign up',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    ],
    ),
    ),
    ),
    ),
    ),
        ],
      ),
    );
  }
}