import 'package:flutter/material.dart';

class PageIdentifier extends StatelessWidget {
  const PageIdentifier(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 30,
          fontFamily: "YoungSerif",
        ),
      ),
    );
  }
}
