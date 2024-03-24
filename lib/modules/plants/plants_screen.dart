import 'package:flutter/material.dart';

class PlantsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late TextEditingController searchController;

    searchController = TextEditingController(); // Initialize searchController

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Material(
                elevation: 4, // Set elevation
                borderRadius: BorderRadius.circular(25.0), // Apply border radius
                child: Row(
                  children: [
                    Expanded(
                      child: defaultFormField(
                        controller: searchController,
                        type: TextInputType.text,
                        onChanged: (value) {},
                        validation: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Search must not be empty';
                          }
                          return null;
                        },
                        label: 'Find your favourite plant here',
                        prefix: Icons.search,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 250.0, 0.0), // Adjust right padding
              child: DropdownButton<String>(
                onChanged: (String? value) {
                  // Handle dropdown value change
                },
                hint: Text('Type'), // Set hint text
                items: <String>['Indoor', 'Outdoor', 'Seeds', 'Tools']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),

            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: _buildPlantItem(),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: _buildPlantItem(),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildPlantItem() {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Plant',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  'LE 1000',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            flex: 2,
            child: Container(
              height: 90.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://www.huntingforgeorge.com/wp-content/uploads/Feature-Best-Winter-Plants-Hunting-for-George-Community-Journal-extra.jpg',
                  ),
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

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required void Function(String)? onChanged,
  required String? Function(String?) validation,
  required String label,
  required IconData prefix,
}) {
  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(25.0),
    borderSide: BorderSide(
      color: Colors.white70,
      width: 2.0,
    ),
  );

  return TextFormField(
    controller: controller,
    keyboardType: type,
    onChanged: onChanged,
    validator: validation,
    decoration: InputDecoration(
      labelText: label,
      suffixIcon: CircleAvatar(
        backgroundColor: Colors.green[900],
        child: Icon(Icons.search, color: Colors.white),
      ),
      border: border,
      focusedBorder: border,
      enabledBorder: border,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.red),
      ),
      fillColor: Colors.white,
      filled: true,
    ),
  );
}