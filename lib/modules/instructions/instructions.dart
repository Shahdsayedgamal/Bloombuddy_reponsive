import 'package:flutter/material.dart';
import 'flowers.dart';


class InstructionsScreen extends StatefulWidget {
  @override
  _InstructionsScreenState createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  late TextEditingController searchController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {});
  }

  void _onCategorySelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildCategoryPage() {
    switch (_selectedIndex) {
      case 0:
        return FlowersScreen(searchQuery: searchController.text);
      default:
        return Center(child: Text('Select a category'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        onChanged: (value) => _onSearchChanged(),
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
            Expanded(
              child: _buildCategoryPage(),
            ),
          ],
        ),
      ),
    );
  }
}