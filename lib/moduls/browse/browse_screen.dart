import 'package:flutter/material.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Browse Screen',
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
