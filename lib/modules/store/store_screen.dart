import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Product_card.dart';

class StoreScreen extends StatefulWidget {
  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  List<Map<String, dynamic>> plantsData = [];

  Future<void> getData() async {
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection("test_plants").get();
      // Convert documents to Map and store in state variable
      setState(
            () {
          plantsData = querySnapshot.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList();
        },
      );
    } catch (e) {
      print('Error fetching data: $e');
      // Optionally, you can display an error message to the user
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    late TextEditingController searchController;

    searchController = TextEditingController(); // Initialize searchController

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Material(
                  elevation: 4, // Set elevation
                  borderRadius: BorderRadius.circular(25.0), // Apply border radius
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
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 250.0, 0.0), // Adjust right padding
              child: DropdownButton<String>(
                onChanged: (String? value) {
                  // Handle dropdown value change
                },
                hint: Text('Categories'), // Set hint text
                items: <String>['Indoor', 'Outdoor', 'Seeds', 'Tools']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),


            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 330,
                    crossAxisSpacing: 6,
                  ),
                  itemCount: plantsData.length,
                  itemBuilder: (context, index) {
                    var product = plantsData[index];
                    return ProductCard(
                        image: product['Picture'], // Ensure this key exists
                        name: product['Name'],
                    indoor_outdoor: product['Indoor_Outdoor']);
                  },
                ),
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
  required void Function(String)? onChanged,
  required String? Function(String?) validation,
  required String label,
  required IconData prefix,
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
    onChanged: onChanged,
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