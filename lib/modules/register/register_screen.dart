import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../layout/layout_app/bloom_layout.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        (Route<dynamic> route) => false,
      );

  void navigateTo(context, widget) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/login.jpg', // Provide your image path here
              fit: BoxFit.cover,
            ),
          ),
          // Back arrow icon
          Positioned(
            top: 90.0,
            left: 20.0,
            child: Container(
              width: 50.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white.withOpacity(0.3),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
                onPressed: () {
                  navigateTo(context, LoginScreen());
                },
              ),
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
                        height: 110.0,
                      ),
                      Text(
                        'Register',
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
                        onFieldSubmitted: (value) {
                          print(value);
                        },
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
                                color: Colors.white,
                                width: 2.0), // Adjust border thickness
                          ),
                          fillColor: Colors.white.withOpacity(0.0),
                          filled: true,
                          labelStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          // Bold white text
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                            // Adjust border thickness
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold), // Bold white text
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
                          prefixIcon: Icon(
                            Icons.lock,
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0), // Adjust border thickness
                          ),
                          fillColor: Colors.white.withOpacity(0.0),
                          filled: true,
                          labelStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          // Bold white text
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                            // Adjust border thickness
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold), // Bold white text
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isPassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Confirm Password must not be empty';
                          } else if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          prefixIcon: Icon(
                            Icons.lock,
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0), // Adjust border thickness
                          ),
                          fillColor: Colors.white.withOpacity(0.0),
                          filled: true,
                          labelStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          // Bold white text
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                            // Adjust border thickness
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold), // Bold white text
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
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
                              print(confirmPasswordController.text);
                              navigateAndFinish(context, AppLayout());
                            }
                          },
                          child: Text('REGISTER',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight:
                                      FontWeight.bold)), // Bold white text
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
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
