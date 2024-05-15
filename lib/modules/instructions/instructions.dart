import 'package:bloom_buddy/modules/instructions/vegetables.dart';
import 'package:flutter/material.dart';
import '../home/last_Arrival.dart';
import 'flowers.dart';
import 'herbs.dart';
import 'plant_guide.dart';

class InstructionsScreen extends StatefulWidget {
  @override
  _InstructionsScreenState createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  late TextEditingController searchController;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    pageController = PageController();
  }

  @override
  void dispose() {
    searchController.dispose();
    pageController.dispose();
    super.dispose();
  }

  void _navigateToPage(int index) {
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
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
              child: TopPickWidget(onNavigate: _navigateToPage),
            ),
            SizedBox(height: 20),
            Expanded(
              child: PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                   FlowersScreen(),
                   HerbsScreen(),
                  VegetablesScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopPickWidget extends StatelessWidget {
  final Function(int) onNavigate;

  const TopPickWidget({
    Key? key,
    required this.onNavigate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ElevatedButton(
          onPressed: () => onNavigate(0),
          child: Text('Flowers'),
        ),
        ElevatedButton(
          onPressed: () => onNavigate(1),
          child: Text('Herbs'),
        ),
        ElevatedButton(
          onPressed: () => onNavigate(2),
          child: Text('Vegetables'),
        ),
      ],
    );
  }
}

class PlantguidePage extends StatefulWidget {
  final String title;

  const PlantguidePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<PlantguidePage> createState() => _PlantguidePageState();
}

class _PlantguidePageState extends State<PlantguidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('${widget.title} Page'),
      ),
    );
  }
}


