import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

class PlantDetailPage extends StatelessWidget {
  final Map<String, dynamic> plantData;

  const PlantDetailPage({Key? key, required this.plantData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Care Guide'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0),

          child: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: Colors.green[900]),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.shade300,
        padding: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Image.network(
                          plantData['picture'],
                          fit: BoxFit.fitHeight,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      plantData['name'],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    final labels = [
                      'Season',
                      'Sun exposure',
                      'Watering',
                      'Growth',
                      'Preparation',
                      'How to plant',
                      'Fertilizing',
                      'Pruning',
                      'Monitoring'
                    ];
                    return _buildGridItem(labels[index], plantData);
                  },
                  childCount: 9,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(String label, Map<String, dynamic> plantData) {
    return Container(
      margin: EdgeInsets.all(8),
      child: GridItem(label: label, plantData: plantData),
    );
  }
}

class GridItem extends StatefulWidget {
  final String label;
  final Map<String, dynamic> plantData;

  GridItem({required this.label, required this.plantData});

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool _isExpanded = true;

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
                  content: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.8,
                    ),
                    child: IntrinsicHeight(
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
                          Flexible(
                            child: Text(
                              _getDetailForLabel(widget.label),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14),
                              maxLines: _isExpanded ? null : 100,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isExpanded = !_isExpanded;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                !_isExpanded ? 'Show Less' : 'Show More',
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
        child: Container(
          padding: EdgeInsets.all(16.0),
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

  String _getDetailForLabel(String label) {
    switch (label) {
      case 'Season':
        return widget.plantData['season'];
      case 'Sun exposure':
        return widget.plantData['sun_exposing'];
      case 'Watering':
        return widget.plantData['watering___sunlight'];
      case 'Growth':
        return widget.plantData['growth'] ?? 'N/A';
      case 'Preparation':
        return widget.plantData['preparation'];
      case 'How to plant':
        return widget.plantData['planting'];
      case 'Fertilizing':
        return widget.plantData['fertilizng'];
      case 'Pruning':
        return widget.plantData['pruning'];
      case 'Monitoring':
        return widget.plantData['monitoring'];
      default:
        return 'No details available.';
    }
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
