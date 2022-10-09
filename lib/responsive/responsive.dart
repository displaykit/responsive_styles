import 'package:flutter/material.dart';
import 'package:responsive_styles/breakpoints/breakpoints.dart';

Breakpoints _getCurrentBreakpoint(double screenWidth) {
  if (screenWidth < breakpoints.sm) {
    return Breakpoints.xs;
  }
  if (screenWidth < breakpoints.md) {
    return Breakpoints.sm;
  }

  if (screenWidth < breakpoints.lg) {
    return Breakpoints.md;
  }

  if (screenWidth < breakpoints.xl) {
    return Breakpoints.lg;
  }

  return Breakpoints.xl;
}

// ============================================================
// [Value resolver]
// ============================================================
const Map<Breakpoints, double> _breakpointsOrderByBreakpoint = {
  Breakpoints.xs: 0,
  Breakpoints.sm: 1,
  Breakpoints.md: 2,
  Breakpoints.lg: 3,
  Breakpoints.xl: 4,
};
const Map<int, Breakpoints> _breakpointsOrderByOrder = {
  0: Breakpoints.xs,
  1: Breakpoints.sm,
  2: Breakpoints.md,
  3: Breakpoints.lg,
  4: Breakpoints.xl,
};
dynamic resolveValueForBreakpoint(
    Map<Breakpoints, dynamic> value, Breakpoints activeBreakpoint) {
  if (value.containsKey(activeBreakpoint) && value[activeBreakpoint] != null) {
    return value[activeBreakpoint];
  }

  var currentBreakpointOrder = _breakpointsOrderByBreakpoint[activeBreakpoint];

  // ignore: todo
  // TODO: I know that I can do it better, but not now
  for (var i = currentBreakpointOrder; i! >= 0; i--) {
    var breakpoint = _breakpointsOrderByOrder[i];
    if (value.containsKey(breakpoint) && value[breakpoint] != null) {
      // Remove px
      return value[breakpoint];
    }
  }
}

// ============================================================

class ScreenWidth {
  final double widthValue;
  const ScreenWidth(this.widthValue);

  double get value {
    return widthValue;
  }

  double percent(double percent) {
    return widthValue * (percent / 100);
  }
}

class Responsive {
  final BuildContext context;

  Responsive(this.context);

  Breakpoints getActiveBreakpoint() {
    var screenSize = MediaQuery.of(context).size.width;
    var activeBreakpoint = _getCurrentBreakpoint(screenSize);

    return activeBreakpoint;
  }

  ScreenWidth get screenWidth {
    var screenSize = MediaQuery.of(context).size.width;
    return ScreenWidth(screenSize);
  }

  ValueType value<ValueType>(
    Map<Breakpoints, ValueType> value,
  ) {
    var activeBreakpoint = getActiveBreakpoint();
    return resolveValueForBreakpoint(value, activeBreakpoint);
  }
}

extension ResponsiveStyles on BuildContext {
  Responsive get responsive => Responsive(this);
}
