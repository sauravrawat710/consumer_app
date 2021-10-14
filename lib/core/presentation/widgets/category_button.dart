import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  String data = "ffff";

  CategoryWidget({
    this.data = "",
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        primary: Colors.black,
        textStyle: const TextStyle(fontSize: 16),
      ),
      onPressed: () {},
      child: Text(data),
    );
  }
}
