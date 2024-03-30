import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../layout/layout_app/bloom_layout.dart';
import '../register/register_screen.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState(); //holds data that can change, manages login screen, state of the login
}

class _LoginScreenState extends State<LoginScreen> {
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
        'assets/images/login.jpg', // Provide your image path here
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
    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
    // Adjust the height as needed
    Text(
    'Login',
    style: TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    ),
    ),
    SizedBox(height: 30.0),
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
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: BorderSide(
    color: Colors.white, // Color of the border
    width: 2.0, // Thickness of the border
    ),
    ),
    fillColor: Colors.white.withOpacity(0.0),
    filled: true,
    labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Bold text
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
    color: Colors.white, // Color of the border
    width: 2.0, // Thickness of the border
    ),
    borderRadius: BorderRadius.circular(25),
    ),
    ),
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Bold text
    ),
    SizedBox(height: 15.0),
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
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: BorderSide(
    color: Colors.white, // Color of the border
    width: 2.5, // Thickness of the border
    ),
    ),
    labelText: 'Password',
    prefixIcon: Icon(
    Icons.lock,
    color: Colors.white,
    ),
    suffixIcon: IconButton(
    icon: Icon(
    isPassword ? Icons.visibility : Icons.visibility_off,
    color: Colors.white,
    ),
    onPressed: () {
    setState(() {
    isPassword = !isPassword;
    });
    },
    ),
    fillColor: Colors.white.withOpacity(0.0),
    filled: true,
    labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Bold text
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
    color: Colors.white, // Color of the border
    width: 2.5, // Thickness of the border
    ),
    borderRadius: BorderRadius.circular(25),
    ),
    ),
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Bold text
    ),
    SizedBox(height: 15.0),
    Container(
    width: double.infinity,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    color: Colors.white.withOpacity(0.3),
    ),
    child: MaterialButton(
    onPressed: () {
    if (formKey.currentState!.validate()) {
    // Form validation successful
    print(emailController.text);
    print(passwordController.text);
    navigateAndFinish(context, AppLayout());
    }
    },
    child: Text('LOGIN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), // Bold text
    ),
    ),
    SizedBox(height: 10.0),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    'Don\'t have an account?',
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Bold text
    ),
    TextButton(
    onPressed: () {
    navigateAndFinish(context, RegisterScreen());
    },
    child: Text('Sign up', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), // Bold text
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