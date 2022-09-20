import 'package:flutter/material.dart';

class TodoAppTheme extends StatelessWidget {
  final Widget child;
  const TodoAppTheme({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'sans-serif',
        primarySwatch: Colors.red,
      ),
      child: child,
    );
  }
}
