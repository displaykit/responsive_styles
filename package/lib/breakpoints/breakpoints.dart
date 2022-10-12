import 'package:flutter/material.dart';

enum Breakpoints {
  xs,
  sm,
  md,
  lg,
  xl,
}

class ThemeBreakpoints {
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;

  const ThemeBreakpoints({
    this.xs = 0,
    this.sm = 480,
    this.md = 768,
    this.lg = 920,
    this.xl = 1200,
  });
}

const _defaultBreakpoints = ThemeBreakpoints();

class BreakpointsBaseValues extends InheritedWidget {
  final Color color;
  final ThemeBreakpoints themeBreakpoints;

  const BreakpointsBaseValues({
    super.key,
    required this.color, // <-- this is the value we want to remove
    this.themeBreakpoints = _defaultBreakpoints,
    required super.child,
  });

  static BreakpointsBaseValues? of(BuildContext context) {
    final BreakpointsBaseValues? result =
        context.dependOnInheritedWidgetOfExactType<BreakpointsBaseValues>();

    if (result == null) {
      return null;
    }

    return result;
  }

  @override
  bool updateShouldNotify(BreakpointsBaseValues oldWidget) =>
      themeBreakpoints != oldWidget.themeBreakpoints;
}
