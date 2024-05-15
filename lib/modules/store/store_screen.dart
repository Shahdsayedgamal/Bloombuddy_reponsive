import 'package:bloom_buddy/modules/store/seeds.dart';
import 'package:flutter/material.dart';
import '../home/last_Arrival.dart';
import '../instructions/flowers.dart';
import '../instructions/herbs.dart';
import '../instructions/vegetables.dart';


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
              child: TopPickWidget(onNavigate: _navigateToPage, selectedCategory: _selectedCategory),
            ),
            SizedBox(height: 20),
            Expanded(
              child: PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SeedsScreen(),
                  HerbsScreen(),
                  VegetablesScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopPickWidget extends StatefulWidget {
  final Function(int) onNavigate;
   String? selectedCategory;

   TopPickWidget({
    Key? key,
    required this.onNavigate,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  _TopPickWidgetState createState() => _TopPickWidgetState();
}

class _TopPickWidgetState extends State<TopPickWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.selectedCategory,
      onChanged: (String? newValue) {
        setState(() {
          widget.selectedCategory = newValue;
        });
        switch (newValue) {
          case 'Flowers':
            widget.onNavigate(0);
            break;
          case 'Herbs':
            widget.onNavigate(1);
            break;
          case 'Vegetables':
            widget.onNavigate(2);
            break;
        }
      },
      hint: Text('Categories'), // Add hint text
      items: <String?>['Flowers', 'Herbs', 'Vegetables']
          .map<DropdownMenuItem<String>>((String? value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value ?? 'Categories'), // Default text when value is null
        );
      }).toList(),
    );
  }
}
