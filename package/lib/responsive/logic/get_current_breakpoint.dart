import 'package:responsive_styles/responsive_styles.dart';

Breakpoints getCurrentBreakpoint(
  double screenWidth,
  ThemeBreakpoints breakpoints,
) {
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
