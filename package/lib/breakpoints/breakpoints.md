# breakpoints

## How to import it?

```dart
import 'package:responsive_styles/responsive_styles.dart';
```
```js
import { breakpoints } from '@displaykit/responsive_styles';
```


## How to use it?

### Dart

- It will provide you the `Breakpoins` _enum_ to be use in `Responsive.value` parameter
- `breakpoints` Provides the default values for breakpoints

```dart
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
```

#### How to customize the default breakpoints?

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BreakpointsBaseValues(
      // You just have to call de BaseValues component and give to it the "themeBreakpoints"
      themeBreakpoints: const ThemeBreakpoints(
        xs: 0,
        sm: 600,
        md: 700,
        lg: 800,
        xl: 900,
      ),
      color: Colors.blue,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'sans-serif',
          primarySwatch: Colors.orange,
        ),
        routes: {
          '/': (context) => const HomeScreen(),
          '/flutter-basic': (context) =>
              const FlutterBasic(title: 'Flutter Demo Home Page'),
          '/holy-grail-layout': (context) => const HolyGrailLayoutScreen(),
          '/chat-app': (context) => const ChatAppScreen(),
          ...todoAppRoutes
        },
      ),
    );
  }
}
```


### JavaScript

- It will provide you an `enum` to be used to receive "responsive parameters"
- `breakpoints` Provides the default values for breakpoints
