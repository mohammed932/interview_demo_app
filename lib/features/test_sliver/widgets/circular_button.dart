import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final String title;
  final String heroTag;
  const CircularButton({super.key, required this.title, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          heroTag: heroTag,
          mini: true,
          onPressed: () {},
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.add,
            color: Colors.black,
            size: 20.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 10.0, color: Colors.black),
        )
      ],
    );
  }
}
