import 'package:flutter/material.dart';
import 'custom_drawer.dart';

class BaseView extends StatelessWidget {
  final String title;
  final Widget body;

  const BaseView({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(16.0),
        child: body,
      ),
    );
  }
}
