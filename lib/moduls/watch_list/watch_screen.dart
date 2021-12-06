import 'package:flutter/material.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Watch List Screen',
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
