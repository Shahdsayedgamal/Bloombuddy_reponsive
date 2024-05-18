import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Product_card.dart';
import 'add_cart.dart';

class ToolsScreen extends StatefulWidget {
  @override
  State<ToolsScreen> createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  List<Map<String, dynamic>> plantsData = [];

  Future<void> getData() async {
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection("Tools_store").get();
      setState(() {
        plantsData = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .where((data) =>
        data['name'] != null &&
            data['picture'] != null &&
            // data['description'] != null &&
            data['price'] != null)
            .toList();
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                  return Toolsdesign(
                    name: product['name'] ?? '',
                    picture: product['picture'] ?? '',
                    // description: product['description'] ?? '',
                    price: product['price']?.toString() ?? '',
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Toolsdesign extends StatelessWidget {
  final String name;
  final String picture;
  //final String description;
  final String price;

  const Toolsdesign({
    Key? key,
    required this.name,
    required this.picture,
    // required this.description,
    required this.price
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Row(
        children: [
          SizedBox(width: 2),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green.shade900,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    ' $price',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Text(
                  //   description,
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 15,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  const SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Container(
                              width: 100.0,
                              height: 35.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  ProductCard.navigateTo(context, AddToCartScreen());
                                },
                                child: Text('Add to Cart'), // Replace 'Button Text' with your desired text
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.favorite, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 5), // Add space between the button row and the image
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.network(
                              picture, // Using the image URL from the passed property
                              width: 120, // Adjust image width as needed
                              height: 120, // Ensure the image height matches the design
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

