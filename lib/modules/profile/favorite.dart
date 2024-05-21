import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../store/kit.dart';

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
  }
}
