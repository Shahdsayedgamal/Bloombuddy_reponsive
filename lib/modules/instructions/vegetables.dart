import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VegetablesScreen extends StatefulWidget {
  @override
  State<VegetablesScreen> createState() => _VegetablesScreenState();
}

class _VegetablesScreenState extends State<VegetablesScreen> {
  List<Map<String, dynamic>> plantsData = [];

  Future<void> getData() async {
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection("vegetables").get();
      setState(() {
        plantsData = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .where((data) =>
        data['name'] != null &&
            data['picture'] != null &&
            data['estimated_time_to_grow'] != null &&
            data['indoor_outdoor'] != null)
            .toList();
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 330,
                  crossAxisSpacing: 6,
                ),
                itemCount: plantsData.length,
                itemBuilder: (context, index) {
                  var product = plantsData[index];
                  return Vegetablesdesign(
                    name: product['name'] ?? '',
                    picture: product['picture'] ?? '',
                    estimated_time_to_grow: product['estimated_time_to_grow'] ?? '',
                    indoor_outdoor: product['indoor_outdoor'] ?? '',
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

class Vegetablesdesign extends StatelessWidget {
  final String name;
  final String picture;
  final String indoor_outdoor;
  final String estimated_time_to_grow;

  const Vegetablesdesign({
    Key? key,
    required this.name,
    required this.picture,
    required this.indoor_outdoor,
    required this.estimated_time_to_grow
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Row(
        children: [
          SizedBox(width: 2),
          Expanded(
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
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    indoor_outdoor,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Time to grow:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    estimated_time_to_grow,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.favorite, color: Colors.white),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                          picture,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }
}

