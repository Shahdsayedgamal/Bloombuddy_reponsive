import 'package:flutter/material.dart';
import '../home/last_Arrival.dart';
import '../instructions/flowers.dart';
import 'kit.dart';



class StoreScreen extends StatefulWidget {
  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  late TextEditingController searchController;
  late PageController pageController;
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    pageController = PageController();
  }

  @override
  void dispose() {
    searchController.dispose();
    pageController.dispose();
    super.dispose();
  }

  void _navigateToPage(int index) {
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {},
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Search must not be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Find your favourite plant here',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              // child: TopPickWidget(onNavigate: _navigateToPage, selectedCategory: _selectedCategory),
            ),
            SizedBox(height: 20),
            Expanded(
              child: PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  KitScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

