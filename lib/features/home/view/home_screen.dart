import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO сделать действие
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Image.asset(
          'assets/images/pokebox.png',
          width: 56,
          height: 56,
        ),
      ),
      body: const Center(
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Column(children: [
                SizedBox(
                  height: 50,
                ),
                Text('Просто текст'),
              ]),
            ),
            Expanded(flex: 4, child: CustomScrollView(slivers: [SliverTasks()]))
          ],
        ),
      ),
    );
  }
}

class SliverTasks extends StatefulWidget {
  const SliverTasks({
    super.key,
  });

  @override
  State<SliverTasks> createState() => _SliverTasksState();
}

class _SliverTasksState extends State<SliverTasks> {
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
                height: 100,
                fit: BoxFit.fill,
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
