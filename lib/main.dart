import 'package:bloom_buddy/modules/store/add_cart.dart';
import 'package:bloom_buddy/shared/shared.network/remote/dio_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bloom_buddy/modules/profile/theme_provider.dart';
import 'layout/layout_app/bloom_layout.dart';
import 'modules/on_boarding/on_boarding_screen.dart';
import 'modules/profile/app_theme.dart';
 // Import your ProfileScreen widget
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
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
            home:AppLayout(),
          );
        },
      ),
    );
  }
}
