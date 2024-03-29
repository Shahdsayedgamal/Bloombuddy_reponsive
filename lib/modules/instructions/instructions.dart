import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/layout_app/cubit.dart';



class InstructionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late TextEditingController searchController;
    searchController = TextEditingController(); // Initialize searchController

    return BlocProvider(
      create: (BuildContext context) => AppCubit(), // Provide the PlantCubit instance
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Material(
                  elevation: 4, // Set elevation
                  borderRadius: BorderRadius.circular(25.0), // Apply border radius
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
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      child: _buildPlantItem(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlantItem() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/images/flower.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Plant Name',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Plant Description. Plant Description. Plant Description.',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$20',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Details',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
}
