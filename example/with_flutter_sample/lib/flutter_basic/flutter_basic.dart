import 'package:flutter/material.dart';
import 'package:responsive_styles/responsive_styles.dart';

class FlutterBasic extends StatefulWidget {
  const FlutterBasic({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FlutterBasic> createState() => _FlutterBasicState();
}

class _FlutterBasicState extends State<FlutterBasic> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var responsive = Responsive(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        // [USAGE] Responsive values in Flutter
        color: responsive.value({
          Breakpoints.xs: Colors.red.shade200,
          Breakpoints.sm: Colors.yellow.shade200,
          Breakpoints.md: Colors.green.shade200,
          Breakpoints.lg: Colors.blue.shade200,
          Breakpoints.xl: Colors.purple.shade200,
        }),
        child: Center(
          // [USAGE] Responsive Row/Column in Flutter
          child: GridItem(
            as: responsive.value({
              Breakpoints.xs: Column,
              Breakpoints.md: Row,
            }),
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Button clicks:'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
