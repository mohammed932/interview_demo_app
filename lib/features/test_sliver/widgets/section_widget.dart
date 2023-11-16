import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10.0),
          child: const Text("Section Title"),
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10, // Customize the number of items in the section
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("Item $index"), // Customize the item content
            );
          },
        ),
      ],
    );
  }
}
