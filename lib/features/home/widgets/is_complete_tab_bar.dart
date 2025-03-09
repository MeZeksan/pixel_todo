import 'package:flutter/material.dart';
import 'package:pixel_todo/core/styles/app_styles.dart';
import 'package:pixel_todo/features/home/widgets/widgets.dart';

class IsCompleteTabBar extends StatelessWidget {
  const IsCompleteTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/wooden_background_desk.png'),
              )),
              child: const TabBar(
                indicatorWeight: 3,
                labelStyle: AppStyles.defaultTextStyle,
                indicatorColor: Colors.white,
                dividerColor: Colors.amberAccent,
                labelColor: Colors.white, // Цвет текста активной вкладки
                unselectedLabelColor: Colors.amberAccent,
                tabs: [
                  Tab(
                    icon: Icon(Icons.assignment),
                    text: 'Активные',
                    iconMargin: EdgeInsets.only(bottom: 4),
                  ),
                  Tab(
                    icon: Icon(Icons.assignment_turned_in),
                    text: 'Выполненные',
                    iconMargin: EdgeInsets.only(bottom: 4),
                  ),
                ],
              )),
          const Expanded(
            child: TabBarView(
              children: [
                BackgroundWidget(isActive: true),
                BackgroundWidget(isActive: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
