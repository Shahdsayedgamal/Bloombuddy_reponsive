import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToCartScreen extends StatefulWidget {
  @override
  State createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  bool showFullDescription = false;
  int productCount = 1;

  void navigateTo(context, widget) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );

  @override
  Widget build(BuildContext context) {
    String shortDescription =
        'Description: This is a description of the plant.';

    String longDescription =
        'Description: This is a description of the plant. It can be a long text to describe the features and care instructions for the plant.';

    String descriptionToShow =
        showFullDescription ? longDescription : shortDescription;

    String descriptionButtonText =
        showFullDescription ? 'Show Less' : 'Show More';

    return Scaffold(
      body: Stack(
        children: [
          // Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.5,
            child:
          Container(
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
                child: Image.asset(
                  'assets/images/flower.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Arrow button
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
          // Content
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
                                  'FLOWER NAME',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Price
                                Text(
                                  '\$29.99',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Counter Container
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.green[900],
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: Container(
                                      width: 150,
                                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
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
                                descriptionToShow,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
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
                            // Counter

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
