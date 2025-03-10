import 'package:flutter/material.dart';
import 'package:pixel_todo/features/home/widgets/widgets.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            alignment: Alignment.topLeft,
            image: AssetImage('assets/images/wooden_background_desk.png'),
            fit: BoxFit.contain,
            repeat: ImageRepeat.repeat, // Повторение фона
            colorFilter: ColorFilter.mode(
                Color.fromARGB(255, 211, 183, 122), BlendMode.overlay)),
      ),
      child: const CustomScrollView(
        slivers: [TasksList()],
      ),
    );
  }
}
