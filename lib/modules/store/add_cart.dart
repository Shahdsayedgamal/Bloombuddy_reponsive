import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToCartScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const AddToCartScreen({Key? key, required this.product}) : super(key: key);

  @override
  State createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  bool showFullDescription = false;
  int productCount = 1;

  @override
  Widget build(BuildContext context) {

    String shortDescription =
        widget.product['description'] ?? 'Description not available.';
    String longDescription = widget.product['longDescription'] ??
        'Detailed description not available.';
    String descriptionToShow =
    showFullDescription ? shortDescription : longDescription;
    String descriptionButtonText =
    showFullDescription ? 'Show Less' : 'Show More';


    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                border: Border.all(
                  color: Colors.green.shade900,
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  widget.product['picture'] ??
                      'https://via.placeholder.com/150',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40.0,
            left: 20.0,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 50.0,
                height: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green[900],
                ),
                child: Icon(Icons.arrow_back_rounded, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.product['name'] ?? 'FLOWER NAME',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black, // Adjusted text color
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'LE ${widget.product['price']?.toString() ?? '30'}',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black, // Adjusted text color
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.green[900],
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: Container(
                                      width: 150,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.remove),
                                            onPressed: () {
                                              setState(() {
                                                if (productCount > 1) {
                                                  productCount--;
                                                }
                                              });
                                            },
                                            color: Colors.white,
                                          ),
                                          Text(
                                            '$productCount',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.add),
                                            onPressed: () {
                                              setState(() {
                                                productCount++;
                                              });
                                            },
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Description',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black, // Adjusted text color
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              descriptionToShow,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black, // Adjusted text color
                              ),
                            ),
                            SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  showFullDescription = !showFullDescription;
                                });
                              },
                              child: Text(
                                descriptionButtonText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green[900],
                                ),
                              ),
                            ),


                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                // Handle add to cart
                              },
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.green[900]!),
                                foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
