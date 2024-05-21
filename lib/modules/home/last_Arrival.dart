import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../store/add_cart.dart';



class LatestArrivalProductsWidget extends StatefulWidget {
  const LatestArrivalProductsWidget({Key? key}) : super(key: key);

  @override
  State<LatestArrivalProductsWidget> createState() => _LatestArrivalProductsWidgetState();
}

class _LatestArrivalProductsWidgetState extends State<LatestArrivalProductsWidget> {
  List<Map<String, dynamic>> products = [];

  Future<void> getLatestArrivals() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("Tools_store")
          .limit(10)
          .get();
      setState(() {
        products = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      });
    } catch (e) {
      print('Error fetching latest arrivals: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getLatestArrivals();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: products.map((product) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddToCartScreen(product: product),
                  ),
                );
              },
              child: SizedBox(
                width: size.width * 0.55,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        width: size.width * 0.3,
                        height: size.width * 0.3,
                        child: FancyShimmerImage(
                          imageUrl: product['picture'] ?? '',
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['name'] ?? 'No title',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add_shopping_cart_rounded,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}