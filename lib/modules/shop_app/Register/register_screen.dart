import 'package:flutter/material.dart';
import '../../../layout/shop_app/shop_layout.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/last.jpeg', // Provide your image path here
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
                      Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 40.0,
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
                          border: OutlineInputBorder(),
                          fillColor: Colors.white.withOpacity(0),
                          filled: true,
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
                              isPassword ? Icons.visibility : Icons.visibility_off,
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
                          filled: true,
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.green,
                        child: MaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              // Form validation successful
                              print(emailController.text);
                              print(passwordController.text);
                              print(confirmPasswordController.text);
                              navigateAndFinish(context, ShopLayout());
                            }
                          },
                          child: Text('REGISTER', style: TextStyle(color: Colors.white)),
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
