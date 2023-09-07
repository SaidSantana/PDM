import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final int index;

  ItemActividad({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> placeNames = [
      "Beach Paradise",
      "Mountain Retreat",
      "Amazing Pool",
      "Hiking Trails",
      "Cycle Your Way",
    ];

    final clampedIndex = index % 5;

    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/activity_image_$clampedIndex.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text("Day ${clampedIndex + 1}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(placeNames[clampedIndex], style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
