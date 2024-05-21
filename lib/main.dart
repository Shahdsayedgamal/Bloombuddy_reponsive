import 'package:bloom_buddy/modules/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:bloom_buddy/modules/store/add_cart.dart';
import 'package:bloom_buddy/shared/shared.network/remote/dio_helper.dart';
import 'package:bloom_buddy/modules/profile/theme_provider.dart';
import 'layout/layout_app/bloom_layout.dart';
import 'modules/instructions/care_guide.dart';
import 'modules/login/login_screen.dart';
import 'modules/on_boarding/on_boarding_screen.dart';
import 'modules/profile/app_theme.dart';
import 'firebase_options.dart';
import 'modules/register/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('======================== User is currently signed out!');
      } else {
        print('======================== User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme,
              context: context,
            ),
            home: AppLayout(),
           // routes: {"register": (context) => RegisterScreen(), "login": (context) => LoginScreen()},
          );
        },
      ),
    );
  }
}
