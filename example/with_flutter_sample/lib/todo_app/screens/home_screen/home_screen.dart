import 'package:flutter/material.dart';
import 'package:responsive_styles/responsive_styles.dart';
import 'package:with_flutter_sample/todo_app/screens/home_screen/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return TodoAppTheme(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
        ),
        body: const Text('Sample page'),
        floatingActionButton: const MainActionButton(),
      ),
    );
  }
}

class MainActionButton extends StatelessWidget {
  const MainActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsive = Responsive(context);

    var btnFull = FloatingActionButton.extended(
      onPressed: () {},
      label: const Text('Add todo'),
      icon: const Icon(Icons.create),
      backgroundColor: Colors.blue,
    );

    var btnCompact = FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.blue,
      child: const Icon(Icons.create),
    );

    return responsive.value({
      Breakpoints.xs: btnCompact,
      Breakpoints.md: btnFull,
    });
  }
}
