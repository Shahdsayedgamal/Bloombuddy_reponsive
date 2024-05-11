import 'package:bloom_buddy/modules/instructions/plant_guide.dart';
import 'package:flutter/material.dart';
import '../home/last_Arrival.dart';


class InstructionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late TextEditingController searchController;

    searchController = TextEditingController(); // Initialize searchController

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Material(
                elevation: 4, // Set elevation
                borderRadius: BorderRadius.circular(25.0), // Apply border radius
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {},
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Search must not be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Find your favourite plant here',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TopPickWidget(),
            ),
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
                  itemCount: 25,
                  itemBuilder: (context, index) {
                    return Plantguide();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopPickWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 8.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.green,
                width: 2.0,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Top Pick',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Text(
          'Indoor',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            '|',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Text(
          'Outdoor',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
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
