import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';

class BottomNavBarItem extends StatelessWidget {
  final int index;
  final bool isSelected;
  final String title;
  final String image;
  final String selectedImage;

  const BottomNavBarItem({super.key, required this.index, required this.isSelected, required this.title, required this.image, required this.selectedImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 25,
          height: 25,
          child: Image.asset(isSelected ? selectedImage : image),
        ),
        Text (
          title,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold)
        )
      ],
    );
  }
}