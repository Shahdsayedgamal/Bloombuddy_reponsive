import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                    child: Text(
                      'Good Morning',
                      style: TextStyle(
                        fontSize: 17, // Reduced font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Increased space below the text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Material(
                      elevation: 4, // Set elevation
                      borderRadius: BorderRadius.circular(25.0), // Apply border radius
                      child: defaultFormField(
                        controller: searchController,
                        type: TextInputType.text,
                        validation: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Search must not be empty';
                          }
                          return null;
                        },
                        label: 'Find your favourite plant here',
                        suffix: Icons.search,
                      ),
                    ),
                  ),
                  SizedBox(height: 30), // Increased space below the search field
                  Container(
                    height: 300, // Set a specific height
                    child: Image(
                      image: AssetImage('assets/images/home1.jpg'), // Corrected file path
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(height: 30), // Increased space below the image
                  Container(
                    height: 200, // Set a specific height
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 150, // Increased image width
                                height: 150, // Increased image height
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15), // Add border radius
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    'https://www.huntingforgeorge.com/wp-content/uploads/Feature-Best-Winter-Plants-Hunting-for-George-Community-Journal-extra.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Plant $index',
                                style: TextStyle(
                                  fontSize: 14, // Increased text size
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?) validation,
  required String label,
  required IconData suffix,
}) {
  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(25.0),
    borderSide: BorderSide(
      color: Colors.white70,
      width: 2.0,
    ),
  );

  return TextFormField(
    controller: controller,
    keyboardType: type,
    validator: validation,
    decoration: InputDecoration(
      labelText: label,
      suffixIcon: CircleAvatar(
        backgroundColor: Colors.green[900],
        child: Icon(Icons.search, color: Colors.white),
      ),
      border: border,
      focusedBorder: border,
      enabledBorder: border,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.red),
      ),
      fillColor: Colors.white,
      filled: true,
    ),
  );
}
