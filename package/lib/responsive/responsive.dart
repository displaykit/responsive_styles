import 'package:flutter/material.dart';
import 'package:responsive_styles/breakpoints/breakpoints.dart';
import 'package:responsive_styles/responsive/logic/get_current_breakpoint.dart';
import 'package:responsive_styles/responsive/logic/resolve_value_for_breakpoint.dart';
import 'package:responsive_styles/responsive/screen_width.dart';

class Responsive {
  final BuildContext context;

  Responsive(this.context);

  Breakpoints getActiveBreakpoint() {
    var screenSize = MediaQuery.of(context).size.width;

    var breakpoints = BreakpointsBaseValues.of(context)?.themeBreakpoints ??
        const ThemeBreakpoints();
    var activeBreakpoint = getCurrentBreakpoint(screenSize, breakpoints);

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
