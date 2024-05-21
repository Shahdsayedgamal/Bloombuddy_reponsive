
import 'package:flutter/material.dart';

import 'instructions.dart';

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);


class PlantDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Care Guide'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.green[900],
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
              onPressed: () {
                navigateTo(context, InstructionsScreen());
              },
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.shade300, // Set background color to light grey
        padding: EdgeInsets.all(20), // Padding for the entire screen
        child: Container(
          padding: EdgeInsets.all(14), // Padding for the white container
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              // White container for image and plant name
              Column(
                children: [
                  // Image section
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Image.asset(
                        'assets/images/Login.jpg',
                        fit: BoxFit.fitHeight,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  SizedBox(height: 8), // Spacing
                  // Plant name section
                  Text(
                    'Selected Plant Name', // Your plant name
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), // Spacing
              // Grid section
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  // Padding for the white container
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: GridView.count(
                    crossAxisCount: 2,
                    // Two columns per row
                    mainAxisSpacing: 40.0,
                    crossAxisSpacing: 50.0,
                    childAspectRatio: 1,
                    // Adjusted aspect ratio for balanced layout
                    children: [
                      _buildGridItem('Season', context),
                      _buildGridItem('Sun exposure', context),
                      _buildGridItem('Watering', context),
                      _buildGridItem('Growth', context),
                      _buildGridItem('Preparation', context),
                      _buildGridItem('How to plant', context),
                      _buildGridItem('Fertilizing', context),
                      _buildGridItem('Pruning', context),
                      _buildGridItem('Monitoring', context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(String label, BuildContext context) {
    return GridItem(label: label, context: context);
  }
}

class GridItem extends StatefulWidget {
  final String label;
  final BuildContext context;

  GridItem({required this.label, required this.context});
  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool _isExpanded = true; // Initially set to true

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  contentPadding: EdgeInsets.all(20),
                  content: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _getIconForLabel(widget.label),
                          size: 50,
                          color: _getIconColor(widget.label),
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.label,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Detailed information about ${widget.label.toLowerCase()} goes here. duwegsiusjn usg8fs8ufe '
                              'jiebufgywhf fehfygsfosjfjs fnieshucmsafjoisf bfiushfo',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                          maxLines: _isExpanded ? null : 100,
                          overflow: TextOverflow.ellipsis,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isExpanded = !_isExpanded; // Toggle _isExpanded
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              !_isExpanded ? 'Show Less' : 'Show More',
                              // Reverse button text
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green[900],
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(15.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400, width: 2),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _getIconForLabel(widget.label),
                size: 40,
                color: _getIconColor(widget.label),
              ),
              SizedBox(height: 5),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  IconData _getIconForLabel(String label) {
    switch (label) {
      case 'Season':
        return Icons.calendar_today;
      case 'Sun exposure':
        return Icons.wb_sunny;
      case 'Watering':
        return Icons.water_drop;
      case 'Growth':
        return Icons.nature;
      case 'Preparation':
        return Icons.spa_outlined;
      case 'How to plant':
        return Icons.help_outline;
      case 'Fertilizing':
        return Icons.opacity;
      case 'Pruning':
        return Icons.content_cut;
      case 'Monitoring':
        return Icons.bug_report_outlined;
      default:
        return Icons.help;
    }
  }

  Color _getIconColor(String label) {
    switch (label) {
      case 'Sun exposure':
        return Colors.yellow;
      case 'Watering':
        return Colors.blue;
      default:
        return Colors.green.shade900;
    }
  }
}