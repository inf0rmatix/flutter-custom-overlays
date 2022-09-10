import 'package:flutter/material.dart';

class IssuePage extends StatefulWidget {
  const IssuePage({super.key});

  @override
  State<IssuePage> createState() => _IssuePageState();
}

class _IssuePageState extends State<IssuePage> {
  int _counter = 0;

  bool showTapTutorial = false;

  bool showDropDown = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Want to build a custom dropdown or an advanced overlay?'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                showTapTutorial = !showTapTutorial;
              }),
              child: const Text('Where should I tap?'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => setState(() {
                showDropDown = !showDropDown;
              }),
              child: const Text('Custom Dropdown'),
            ),
            if (showDropDown)
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.amberAccent,
                ),
                child: const Text('AM PSEUDO DROPDOWN. \nBut not respecting owners size. hehe'),
              ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          if (showTapTutorial)
            Positioned.fill(
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.yellow,
                      width: 4,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'HERE',
                      style: TextStyle(
                        backgroundColor: Color(0xAAFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
