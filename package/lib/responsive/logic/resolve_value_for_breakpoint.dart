import 'package:responsive_styles/responsive_styles.dart';

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
      return value[breakpoint];
    }
  }
}
