import 'dart:math';

import 'package:flutter/material.dart';

class ItemCategoryCard extends StatelessWidget {
  final String categoryTitle;

  const ItemCategoryCard({
    super.key,
    required this.categoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    final randomizer = Random();

    return Container(
      width: double.infinity,
      height: 153,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
              'assets/images/schedular_app_${randomizer.nextInt(2) + 1}.jpg'),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        child: Column(
          children: [
            Text(
              categoryTitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
