
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final List<String> favoriteImages = [
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
          slivers: <Widget>[
          SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height / 3, // Adjusted height for the top image
      flexibleSpace: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/profile2.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ),
        ],
      ),
      pinned: false,
    ),
    SliverToBoxAdapter(
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    SizedBox(height: 50),
    SizedBox(height: 20),
    Text(
    'John Doe',
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 10),
    Text(
    'Software Developer',
    style: TextStyle(
    fontSize: 18,
    fontStyle: FontStyle.italic,
    ),
    ),
    SizedBox(height: 20),
    Text(
    'Favorites',
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 10),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Expanded(
    child: Column(
    children: [
    for (int i = 0; i < 3; i++)
    _buildFavoritePhoto(favoriteImages[i]),
    ],
    ),
    ),
    Expanded(
    child: Column(
    children: [
    for (int i = 3; i < 6; i++)
    _buildFavoritePhoto(favoriteImages[i]),
    ],
    ),
    ),
    Expanded(
    child: Column(
    children: [
    for (int i = 6; i < 9; i++)
    _buildFavoritePhoto(favoriteImages[i]),
    ],
    ),
    ),
    ],
    ),
      SizedBox(height: 200),
    ],
    ),
    ),
    ),
          ],
          ),
      ),
    );
  }

  Widget _buildFavoritePhoto(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}