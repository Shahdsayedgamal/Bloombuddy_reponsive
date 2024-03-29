import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> favoriteImages = [
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
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
              ),
              SizedBox(height: 50),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Favorites',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
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