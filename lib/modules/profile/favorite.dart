import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../store/add_cart.dart';
import '../store/kit.dart'; // Adjust import as needed
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Map<String, dynamic>> favoriteItems = [];

  Future<void> loadFavoriteItems() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteItemsJson = prefs.getStringList('favoriteItems') ?? [];
    setState(() {
      favoriteItems = favoriteItemsJson.map((item) => jsonDecode(item) as Map<String, dynamic>).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadFavoriteItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: favoriteItems.isEmpty
          ? Center(child: Text("No favorite items"))
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 330,
            crossAxisSpacing: 6,
          ),
          itemCount: favoriteItems.length,
          itemBuilder: (context, index) {
            var product = favoriteItems[index];
            return KitDesign(
              product: product,
              isFavorite: true,
              onFavoriteToggle: () => toggleFavoriteStatus(product),
            );
          },
        ),
      ),
    );
  }

  Future<void> toggleFavoriteStatus(Map<String, dynamic> product) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteItemsJson = prefs.getStringList('favoriteItems') ?? [];
    setState(() {
      if (favoriteItemsJson.contains(jsonEncode(product))) {
        favoriteItemsJson.remove(jsonEncode(product));
      } else {
        favoriteItemsJson.add(jsonEncode(product));
      }
    });
    await prefs.setStringList('favoriteItems', favoriteItemsJson);
    loadFavoriteItems(); // Reload the favorite items to update the UI
  }
}


class KitDesign extends StatefulWidget {
  final Map<String, dynamic> product;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const KitDesign({
    Key? key,
    required this.product,
    required this.isFavorite,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  _KitDesignState createState() => _KitDesignState();
}

class _KitDesignState extends State<KitDesign> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
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
                          child: IconButton(
                            icon: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                              widget.onFavoriteToggle();
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