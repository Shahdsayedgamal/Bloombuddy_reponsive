import 'package:flutter/material.dart';

class LandscapeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                'Your Partner in Landscaping Solutions',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 30),
              _buildContactInfo(
                icon: Icons.phone,
                label: 'Phone Number',
                info: '012345678910',
              ),
              SizedBox(height: 20),
              _buildContactInfo(
                icon: Icons.email,
                label: 'Email',
                info: 'bloombuddy@gmail.com',
              ),
              SizedBox(height: 30),
              _buildSectionTitle('Our Services'),
              _buildServiceItem('Landscape Design'),
              _buildServiceItem('Lawn Care and Maintenance'),
              _buildServiceItem('Garden Installation'),
              _buildServiceItem('Irrigation Systems'),
              _buildServiceItem('Tree and Shrub Planting'),
              SizedBox(height: 30),
              _buildSectionTitle('Customer Reviews'),
              _buildTestimonialItem(
                name: 'John Doe',
                review: 'Amazing work! Highly recommended.',
              ),
              _buildTestimonialItem(
                name: 'Jane Smith',
                review: 'Professional and efficient service.',
              ),
              SizedBox(height: 30),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo({
    required IconData icon,
    required String label,
    required String info,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.green[900], size: 24),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
            ),
            Text(
              info,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.green[900],
      ),
    );
  }

  Widget _buildServiceItem(String service) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5),
      child: Row(
        children: [
          Icon(Icons.done, color: Colors.green[900], size: 20),
          SizedBox(width: 10),
          Text(
            service,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialItem({required String name, required String review}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green[900],
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text(
            review,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          subtitle: Text(
            '- $name',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      color: Colors.green[900],
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Text(
        'Contact us!',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

