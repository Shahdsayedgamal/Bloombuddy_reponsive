import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FlowersScreen extends StatefulWidget {
  final String searchQuery;

  const FlowersScreen({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<FlowersScreen> createState() => _FlowersScreenState();
}

class _FlowersScreenState extends State<FlowersScreen> {
  List<Map<String, dynamic>> plantsData = [];
  List<String> collectionData = ["Flower", "herbs", "Vegetables"];
  String selectedCollection = "Flower";

  Future<void> getData(String query) async {
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection(selectedCollection).get();
      setState(() {
        plantsData = querySnapshot.docs
            .map((doc) => {
          ...doc.data() as Map<String, dynamic>,
          'isFavorite': false,
        })
            .where((data) =>
        data['name'] != null &&
            data['picture'] != null &&
            data['estimated_time'] != null &&
            data['indoor_outdoor'] != null &&
            (query.isEmpty ||
                data['name'].toLowerCase().contains(query.toLowerCase())))
            .toList();
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getData(widget.searchQuery);
  }

  @override
  void didUpdateWidget(covariant FlowersScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchQuery != widget.searchQuery) {
      getData(widget.searchQuery);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
          children: [
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          // Category Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: collectionData.map((collection) {
              return ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedCollection = collection;
                    getData(widget.searchQuery);
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: selectedCollection == collection
                      ? Colors.white
                      : Colors.green[900],
                  backgroundColor: selectedCollection == collection
                      ? Colors.green[900]
                      : Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  collection,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.04, // Adjust font size
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    ),
    SizedBox(height: screenHeight * 0.01),
    Expanded(
    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: screenWidth < 600 ? 2 : 3,
    // Responsive columns
    mainAxisExtent: screenHeight * 0.35,
    // Adjusted for responsiveness
    crossAxisSpacing: screenWidth * 0.02,
    // Responsive spacing
      mainAxisSpacing: screenHeight * 0.02, // Responsive spacing
    ),
      itemCount: plantsData.length,
      itemBuilder: (context, index) {
        var product = plantsData[index];
        return FlowersDesign(
          name: product['name'],
          picture: product['picture'],
          estimated_time: product['estimated_time'],
          indoor_outdoor: product['indoor_outdoor'],
        );
      },
    ),
    ),
    ),
          ],
      ),
    );
  }
}

class FlowersDesign extends StatelessWidget {
  final String name;
  final String picture;
  final String indoor_outdoor;
  final String estimated_time;

  const FlowersDesign({
    Key? key,
    required this.name,
    required this.picture,
    required this.indoor_outdoor,
    required this.estimated_time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      padding: EdgeInsets.all(screenWidth * 0.03),
      decoration: BoxDecoration(
        color: Colors.green.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.045, // Adjust font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              // IconButton(
              //   icon: Icon(
              //     isFavorite ? Icons.favorite : Icons.favorite_border,
              //     color: isFavorite ? Colors.red : Colors.white,
              //   ),
              // ),
            ],
          ),
          SizedBox(height: screenHeight * 0.005),
          Text(
            indoor_outdoor,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.04, // Adjust font size
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.005),
          Text(
            estimated_time,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.05, // Adjust font size
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                  picture,
                  width: screenWidth * 0.3, // Adjust image size
                  height: screenHeight * 0.15, // Adjust image size
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}