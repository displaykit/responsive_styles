# breakpoints

## How to import it?

```dart
import 'package:skynexui_responsive_stylesheet/skynexui_responsive_stylesheet.dart';
```
```js
import { breakpoints } from '@skynexui/responsive_stylesheet';
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


### JavaScript

- It will provide you an `enum` to be used to receive "responsive parameters"
- `breakpoints` Provides the default values for breakpoints
