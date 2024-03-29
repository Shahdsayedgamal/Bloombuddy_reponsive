import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true, // Added to prevent unnecessary scrolling
                physics: NeverScrollableScrollPhysics(), // Added to prevent scrolling
                children: favoriteImages.map((imageUrl) => _buildFavoritePhoto(imageUrl)).toList(),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFavoritePhoto(String imageUrl) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}