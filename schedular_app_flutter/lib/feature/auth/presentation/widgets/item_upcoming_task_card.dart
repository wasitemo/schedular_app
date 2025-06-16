import 'package:flutter/material.dart';

class ItemUpcomingTaskCard extends StatefulWidget {
  final String taskTitle;
  final String taskTime;

  const ItemUpcomingTaskCard({
    super.key,
    required this.taskTitle,
    required this.taskTime,
  });

  @override
  State<ItemUpcomingTaskCard> createState() => _ItemUpcomingTaskCardState();
}

class _ItemUpcomingTaskCardState extends State<ItemUpcomingTaskCard> {
  bool taskStatus = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.taskTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    widget.taskTime,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ],
              ),
            ),
            Checkbox(
              value: taskStatus,
              side: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              activeColor: Theme.of(context).colorScheme.secondaryContainer,
              checkColor: Theme.of(context).colorScheme.primary,
              onChanged: (bool? newValue) {
                setState(() {
                  taskStatus = newValue ?? false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
