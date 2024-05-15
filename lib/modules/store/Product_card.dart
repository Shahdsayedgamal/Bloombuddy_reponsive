import 'package:bloom_buddy/modules/store/add_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProductCard extends StatefulWidget {
  final String name ;
  final String image ;
  final String indoor___outdoor ;
  // Add any required fields if you need to pass data to the ProductCard
  const ProductCard({Key? key, required this.name, required this.image, required this.indoor___outdoor}) : super(key: key);

  static void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    // Encapsulate everything in a SingleChildScrollView to avoid overflow
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(), // Disable scrolling
      child: Row( // Change to Row
        children: [
          SizedBox(width: 2), // Add space between green container and others
          Expanded( // Use Expanded for the green container to take remaining space
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7, // Adjust width of the green container
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green.shade900,
                borderRadius: BorderRadius.circular(12), // Reduce border radius
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // To wrap the content within the column
                children: [
                   Text(
                    widget.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                   Text(
                    widget.indoor___outdoor ,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    '30\$',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height:5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Container(
                              width: 100.0,
                              height: 40.0,
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
                      SizedBox(height: 8), // Add space between the button row and the image
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.network(
                              widget.image, // Using the image URL from the passed property
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
          SizedBox(width: 5), // Add bigger space between the two columns
        ],
      ),
    );
  }
}
