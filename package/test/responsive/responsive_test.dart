import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_styles/responsive_styles.dart';

class WidgetWithResponsiveOutput extends StatelessWidget {
  const WidgetWithResponsiveOutput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var responsive = Responsive(context);
    var outputValue = responsive.value({
      Breakpoints.xs: 'xs',
      Breakpoints.sm: 'sm',
      Breakpoints.md: 'md',
      Breakpoints.lg: 'lg',
      Breakpoints.xl: 'xl',
    });
    return Text("Screen: $outputValue");
  }
}

// TODO: Add tests on top of this
class WidgetWithResponsiveOutputByBuildContext extends StatelessWidget {
  const WidgetWithResponsiveOutputByBuildContext({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var outputValue = context.responsive.value({
      Breakpoints.xs: 'xs',
      Breakpoints.sm: 'sm',
      Breakpoints.md: 'md',
      Breakpoints.lg: 'lg',
      Breakpoints.xl: 'xl',
    });
    return Text("Screen: $outputValue");
  }
}

class WidgetWithResponsiveScreenWidthPercentageAccess extends StatelessWidget {
  final double percent;
  const WidgetWithResponsiveScreenWidthPercentageAccess(
      {Key? key, required this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsive = Responsive(context);
    var outputValue = responsive.screenWidth.percent(percent);
    return Text("ScreenWidth: $outputValue");
  }
}

class WidgetWithResponsiveScreenWidthValueAccess extends StatelessWidget {
  const WidgetWithResponsiveScreenWidthValueAccess({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsive = Responsive(context);
    var outputValue = responsive.screenWidth.value;
    return Text("ScreenWidth: $outputValue");
  }
}

const double screenHeight = 500;

void main() {
  Widget makeTestableWidget({required Widget child, required Size size}) {
    return MaterialApp(
      home: MediaQuery(
        data: MediaQueryData(size: size),
        child: child,
      ),
    );
  }

  group("screenWidth()", () {
    const double screenWidthOf1000 = 1000;
    testWidgets(
      "when get screen size returns its value",
      (WidgetTester tester) async {
        var testableWidget = makeTestableWidget(
          child: const WidgetWithResponsiveScreenWidthValueAccess(),
          size: const Size(screenWidthOf1000, screenHeight),
        );
        await tester.pumpWidget(testableWidget);
        expect(find.text('ScreenWidth: 1000.0'), findsOneWidget);
      },
    );

    testWidgets(
      "when get 10% of a screen with 1000 of size, return '100.0'",
      (WidgetTester tester) async {
        const double percent = 10;
        var testableWidget = makeTestableWidget(
          child: const WidgetWithResponsiveScreenWidthPercentageAccess(
              percent: percent),
          size: const Size(screenWidthOf1000, screenHeight),
        );
        await tester.pumpWidget(testableWidget);
        expect(find.text('ScreenWidth: 100.0'), findsOneWidget);
      },
    );

    testWidgets(
      "when get 40% of a screen with 1000 of size, return '400.0'",
      (WidgetTester tester) async {
        const double percent = 40;
        var testableWidget = makeTestableWidget(
          child: const WidgetWithResponsiveScreenWidthPercentageAccess(
              percent: percent),
          size: const Size(screenWidthOf1000, screenHeight),
        );
        await tester.pumpWidget(testableWidget);
        expect(find.text('ScreenWidth: 400.0'), findsOneWidget);
      },
    );
  });

  group("value()", () {
    testWidgets(
      'when is in a xs screen, returns the xs value',
      (WidgetTester tester) async {
        var screenWidthLessThanSm = breakpoints.sm - 1;
        var screenWidthOfXsBreakpoint = screenWidthLessThanSm;

        var testableWidget = makeTestableWidget(
          child: const WidgetWithResponsiveOutput(),
          size: Size(screenWidthOfXsBreakpoint, screenHeight),
        );
        await tester.pumpWidget(testableWidget);

        expect(find.text('Screen: xs'), findsOneWidget);
      },
    );

    testWidgets(
      'when is in a sm screen, returns the sm value',
      (WidgetTester tester) async {
        var screenWidthLessThanMdAndBiggerThanSm = breakpoints.md - 1;
        var screenWidthOfSmBreakpoint = screenWidthLessThanMdAndBiggerThanSm;
        var testableWidget = makeTestableWidget(
          child: const WidgetWithResponsiveOutput(),
          size: Size(screenWidthOfSmBreakpoint, screenHeight),
        );
        await tester.pumpWidget(testableWidget);

        expect(find.text('Screen: sm'), findsOneWidget);
      },
    );

    testWidgets(
      'when is in a md screen, returns the md value',
      (WidgetTester tester) async {
        var screenWidthLessThanLgAndBiggerThanMd = breakpoints.lg - 1;
        var screenWidthOfMdBreakpoint = screenWidthLessThanLgAndBiggerThanMd;
        var testableWidget = makeTestableWidget(
          child: const WidgetWithResponsiveOutput(),
          size: Size(screenWidthOfMdBreakpoint, screenHeight),
        );
        await tester.pumpWidget(testableWidget);

        expect(find.text('Screen: md'), findsOneWidget);
      },
    );

    testWidgets(
      'when is in a lg screen, returns the lg value',
      (WidgetTester tester) async {
        var screenWidthLessThanXlAndBiggerThanLg = breakpoints.xl - 1;
        var screenWidthOfLgBreakpoint = screenWidthLessThanXlAndBiggerThanLg;
        var testableWidget = makeTestableWidget(
          child: const WidgetWithResponsiveOutput(),
          size: Size(screenWidthOfLgBreakpoint, screenHeight),
        );
        await tester.pumpWidget(testableWidget);

        expect(find.text('Screen: lg'), findsOneWidget);
      },
    );

    testWidgets(
      'when is in a xl screen, returns the xl value',
      (WidgetTester tester) async {
        // For now, this is the biggest one from it to infinity.
        var screenWidthOfXlBreakpoint = breakpoints.xl;
        var testableWidget = makeTestableWidget(
          child: const WidgetWithResponsiveOutput(),
          size: Size(screenWidthOfXlBreakpoint, screenHeight),
        );
        await tester.pumpWidget(testableWidget);

        expect(find.text('Screen: xl'), findsOneWidget);
      },
    );
  });
}
