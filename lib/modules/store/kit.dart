import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../profile/favorite.dart'; // Adjust import as needed
import 'add_cart.dart';

class KitScreen extends StatefulWidget {
  @override
  State<KitScreen> createState() => _KitScreenState();
}

class _KitScreenState extends State<KitScreen> {
  List<Map<String, dynamic>> plantsData = [];
  List<String> collectionData = ["Fertilizers_store", "Tools_store", "seeds_store", "Kits_store"];
  String selectedCollection = "Tools_store";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(selectedCollection).get();
      plantsData = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .where((data) =>
      data['name'] != null &&
          data['picture'] != null &&
          data['price'] != null)
          .toList();
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<bool> isFavorite(Map<String, dynamic> product) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteItemsJson = prefs.getStringList('favoriteItems') ?? [];
    return favoriteItemsJson.contains(jsonEncode(product));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: collectionData.map((collection) {
                        return ElevatedButton(
                          onPressed: () {
                            if (selectedCollection != collection) {
                              setState(() {
                                selectedCollection = collection;
                                getData();
                              });
                            }
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
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 330,
                  crossAxisSpacing: 6,
                ),
                itemCount: plantsData.length,
                itemBuilder: (context, index) {
                  var product = plantsData[index];
                  return FutureBuilder<bool>(
                    key: UniqueKey(),
                    future: isFavorite(product),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text("Error: ${snapshot.error}"));
                      } else {
                        bool isFavorite = snapshot.data ?? false;
                        return KitDesign(
                          product: product,
                          isFavorite: isFavorite,
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KitDesign extends StatefulWidget {
  final Map<String, dynamic> product;
  final bool isFavorite;

  const KitDesign({
    Key? key,
    required this.product,
    required this.isFavorite,
  }) : super(key: key);

  @override
  _KitDesignState createState() => _KitDesignState();
}

class _KitDesignState extends State<KitDesign> {
  late ValueNotifier<bool> isFavoriteNotifier;

  @override
  void initState() {
    super.initState();
    isFavoriteNotifier = ValueNotifier<bool>(widget.isFavorite);
  }

  Future<void> toggleFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteItemsJson = prefs.getStringList('favoriteItems') ?? [];

    bool isAlreadyFavorite = favoriteItemsJson.contains(jsonEncode(widget.product));

    if (!isAlreadyFavorite) {
      favoriteItemsJson.add(jsonEncode(widget.product));
    } else {
      favoriteItemsJson.remove(jsonEncode(widget.product));
    }

    await prefs.setStringList('favoriteItems', favoriteItemsJson);
    isFavoriteNotifier.value = !isFavoriteNotifier.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddToCartScreen(product: widget.product),
          ),
        );
      },
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Row(
          children: [
            SizedBox(width: 5),
            Flexible(
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
                      widget.product['name'] ?? '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'LE ${widget.product['price']?.toString() ?? ''}',
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
                          child: ValueListenableBuilder<bool>(
                            valueListenable: isFavoriteNotifier,
                            builder: (context, isFavorite, child) {
                              return IconButton(
                                icon: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite_border,
                                  color: Colors.white,
                                ),
                                onPressed: toggleFavoriteStatus,
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.network(
                                widget.product['picture'] ?? '',
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
