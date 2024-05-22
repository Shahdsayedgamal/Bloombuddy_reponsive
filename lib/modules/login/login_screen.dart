import 'package:bloom_buddy/layout/layout_app/bloom_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../register/register_screen.dart';
 // Import PlantLayout

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
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

  Future<void> loginUser(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      navigateAndFinish(context,
          AppLayout()); // Navigate to PlantLayout after successful login
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else {
        errorMessage = 'An unknown error occurred: ${e.message}';
      }
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Error'),
          content: Text('An error occurred. Please try again. Error: $e'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

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
                          labelStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          // Bold text
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, // Color of the border
                              width: 2.0, // Thickness of the border
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold), // Bold text
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
                          fillColor: Colors.white.withOpacity(0.0),
                          filled: true,
                          labelStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          // Bold text
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, // Color of the border
                              width: 2.5, // Thickness of the border
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold), // Bold text
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
                              loginUser(
                                emailController.text,
                                passwordController.text,
                              );
                            }
                          },
                          child: Text('LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)), // Bold text
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold), // Bold text
                          ),
                          TextButton(
                            onPressed: () {
                              navigateAndFinish(context, RegisterScreen());
                            },
                            child: Text('Sign up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)), // Bold text
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
