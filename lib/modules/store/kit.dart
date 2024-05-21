import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'add_cart.dart';

class KitScreen extends StatefulWidget {
  @override
  State<KitScreen> createState() => _KitScreenState();
}

class _KitScreenState extends State<KitScreen> {
  List<Map<String, dynamic>> plantsData = [];
  List<String> collectionData = ["Ktis_store", "Tools_store", "seeds_store"];
  String selectedCollection = "Ktis_store";

  Future<void> getData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(selectedCollection).get();
      setState(() {
        plantsData = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .where((data) =>
        data['name'] != null &&
            data['picture'] != null &&
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                // Category Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: collectionData.map((collection) {
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedCollection = collection;
                          getData();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: selectedCollection == collection ? Colors.white : Colors.green[900],
                        backgroundColor: selectedCollection == collection ? Colors.green[900] : Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text(
                        collection.replaceAll('_store', ' '),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
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
                  return KitDesign(
                    product: product,
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

class KitDesign extends StatelessWidget {
  final Map<String, dynamic> product;

  const KitDesign({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddToCartScreen(product: product),
          ),
        );
      },
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Row(
          children: [
            SizedBox(width: 5),
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
                      product['name'] ?? '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'LE ${product['price']?.toString() ?? ''}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.favorite, color: Colors.white),
                        ),
                        // SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.network(
                                product['picture'] ?? '',
                                width: 120,
                                height: 120,
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
      ),
    );
  }
}
