import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bloom_buddy/modules/profile/theme_provider.dart';
import 'CustomListTitle.dart';
import 'Privacy.dart';
import 'favorite.dart';
import 'order_details.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      theme: themeProvider.getIsDarkTheme ? ThemeData.dark() : ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => const ProfileScreenContent(),
        '/order_details': (context) => OrderScreen(),
        '/favorites': (context) => FavoriteScreen(),
        '/privacy_terms': (context) => PrivacyScreen(),
      },
    );
  }
}

class ProfileScreenContent extends StatelessWidget {
  const ProfileScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Visibility(
                visible: false,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Please log in to get full access",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).cardColor,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.background,
                          width: 3,
                        ),
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Shahd sayed"),
                        Text(
                          "eslam2002eslam@gmail.com",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("GENERAL"),
                    CustomListTile(
                      imagePath: "assets/images/profile2.jpg",
                      text: "ORDER DETAILS",
                      function: () {
                        Navigator.pushNamed(context, '/order_details');
                      },
                    ),
                    CustomListTile(
                      imagePath: "assets/images/profile2.jpg",
                      text: "FAVORITES",
                      function: () {
                        Navigator.pushNamed(context, '/favorites');
                      },
                    ),
                    const SizedBox(height: 0),
                    const Divider(thickness: 4),
                    const SizedBox(height: 0),
                    const Text("Setting"),
                    SwitchListTile(
                      secondary: Image.asset(
                        "assets/images/profile2.jpg",
                        height: 40,
                      ),
                      title: Text(
                        themeProvider.getIsDarkTheme ? "DARK MODE" : "LIGHT MODE",
                      ),
                      value: themeProvider.getIsDarkTheme,
                      onChanged: (value) {
                        themeProvider.setDarkTheme(themeValue: value);
                      },
                    ),
                    const SizedBox(height: 10),
                    const Divider(thickness: 4),
                    CustomListTile(
                      imagePath: "assets/images/profile2.jpg",
                      text: "PRIVACY AND TERMS",
                      function: () {
                        Navigator.pushNamed(context, '/privacy_terms');
                      },
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
