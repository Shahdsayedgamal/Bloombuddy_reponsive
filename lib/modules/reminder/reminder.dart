import 'package:flutter/material.dart';

class ReminderScreen extends StatelessWidget {
  var reminderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reminder',
        ),
      ),
    );
  }
}