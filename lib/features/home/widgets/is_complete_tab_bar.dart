import 'package:flutter/material.dart';
import 'package:pixel_todo/core/styles/app_styles.dart';

class isCompleteTabBar extends StatelessWidget {
  const isCompleteTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorWeight: 3,
      labelStyle: AppStyles.defaultTextStyle,
      indicatorColor: Colors.white,
      dividerColor: Colors.transparent,
      tabs: [
        Tab(
          icon: Container(
            padding: const EdgeInsets.all(4), // Отступ для свечения
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurpleAccent,
                  blurRadius: 20,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: const Icon(Icons.assignment, size: 25, color: Colors.white),
          ),
          iconMargin: const EdgeInsets.only(bottom: 4),
        ),
        Tab(
          icon: Container(
            padding: const EdgeInsets.all(4), // Отступ для свечения
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.lightGreenAccent,
                  blurRadius: 20,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: const Icon(
              Icons.assignment_turned_in,
              size: 25,
              color: Colors.white,
            ),
          ),
          iconMargin: const EdgeInsets.only(bottom: 4),
        ),
      ],
    );
  }
}
