import 'package:flutter/material.dart';

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('SliverList Example')),
        body: const Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverListExample(),
              ],
            ),
            Positioned(
              top: 50, // Позиция по оси Y
              left: 0, // Позиция по оси X
              right: 0, // Растянуть на всю ширину
              child: AnimationDemo(), // Кнопка будет сверху
            ),
          ],
        ),
      ),
    );
  }
}

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({super.key});

  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  bool _isPressedGesture = false;
  final bool _isPressedInk = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // GestureDetector with Scale Animation
        GestureDetector(
          onTapDown: (_) => setState(() => _isPressedGesture = true),
          onTapUp: (_) => setState(() => _isPressedGesture = false),
          onTapCancel: () => setState(() => _isPressedGesture = false),
          child: AnimatedScale(
            scale: _isPressedGesture ? 0.9 : 1.0, // Scale down when pressed
            duration: const Duration(milliseconds: 100),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset('assets/images/button.png'),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class SliverListExample extends StatefulWidget {
  const SliverListExample({super.key});

  @override
  _SliverListExampleState createState() => _SliverListExampleState();
}

class _SliverListExampleState extends State<SliverListExample> {
  final List<String> items = List.generate(20, (index) => 'Item $index');
  final List<bool> isChecked = List.generate(20, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/pergament.png',
                width: double.infinity,
                height: 145,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 16,
                child: Checkbox(
                  activeColor: Colors.red,
                  checkColor: Colors.blue,
                  value: isChecked[index],
                  onChanged: (value) {
                    setState(() {
                      isChecked[index] = value ?? false;
                    });
                  },
                ),
              ),
              Positioned(
                left: 60,
                child: Text(
                  items[index],
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ],
          );
        },
        childCount: items.length,
      ),
    );
  }
}
