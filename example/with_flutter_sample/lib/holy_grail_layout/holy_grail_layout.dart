import 'package:flutter/material.dart';
import 'package:skynexui_responsive_stylesheet/skynexui_responsive_stylesheet.dart';

class HolyGrailLayoutScreen extends StatelessWidget {
  const HolyGrailLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Holy Grail Layout"),
      ),
      body: const _HolyGrailLayoutBody(),
    );
  }
}

class _HolyGrailLayoutBody extends StatelessWidget {
  const _HolyGrailLayoutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsive = Responsive(context);
    double screenHeight = MediaQuery.of(context).size.height;

    return GridItem(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: GridItem(
              children: [
                const _Header(),
                Container(
                  constraints: BoxConstraints(minHeight: screenHeight - 100),
                  color: responsive.value({
                    Breakpoints.xs: Colors.red.shade200,
                    Breakpoints.sm: Colors.yellow.shade200,
                    Breakpoints.md: Colors.green.shade200,
                    Breakpoints.lg: Colors.blue.shade200,
                  }),
                  child: GridItem(
                    as: Row,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const _Body(),
                      _Aside(responsive: responsive),
                    ],
                  ),
                ),
                const _Footer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 50,
      color: Colors.purple.shade500,
      child: const GridItem(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Header',
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsive = Responsive(context);

    return Container(
      color: Colors.red.shade100,
      child: Container(
        width: MediaQuery.of(context).size.width,
        constraints: BoxConstraints(
          maxWidth: responsive.value({
            Breakpoints.xs: 500,
            Breakpoints.lg: 600,
          }),
        ),
        child: GridItem(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Body',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const Text(
              '''
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vestibulum lacus arcu, eget interdum neque eleifend nec. Donec sit amet sapien bibendum, pellentesque nibh id, molestie neque. Praesent id elit non turpis imperdiet placerat. Quisque non mollis sem. Morbi ac lorem dictum, fringilla nisi varius, viverra nunc. Mauris condimentum molestie efficitur. Vivamus vestibulum diam at vehicula aliquam. Proin sagittis dui at nisl feugiat, ac pellentesque nisl mattis. Vivamus imperdiet elit et erat molestie, id lacinia purus vestibulum. Nam maximus dui ut hendrerit rutrum. Maecenas ultrices augue non quam porta posuere sed nec odio.
Nullam vitae tellus a mauris suscipit feugiat vitae non nulla. Vestibulum massa elit, dapibus nec lorem id, gravida faucibus ligula. Fusce luctus risus vestibulum felis scelerisque euismod. Aenean quis sem dolor. Ut placerat turpis ut mattis convallis. Morbi hendrerit metus vitae quam tristique, ultricies rhoncus neque efficitur. In dapibus iaculis tempor. Curabitur ligula nunc, pulvinar quis sagittis eget, iaculis ac dolor. Aliquam ut tortor dapibus, sollicitudin augue suscipit, porta eros. Integer eget vulputate mauris, ac posuere tellus.
Praesent ac venenatis nunc. Maecenas eu tortor et nunc tempor feugiat. Morbi semper arcu id faucibus suscipit. Pellentesque volutpat vel nunc eu euismod. Fusce sagittis risus a porttitor lacinia. Suspendisse potenti. Sed nisi metus, ultricies vel dolor vitae, iaculis efficitur lorem.
Sed quis nunc iaculis, egestas erat facilisis, ornare sem. Nullam nec posuere ligula, ac rutrum tellus. Etiam accumsan lorem odio, nec vehicula ante euismod ut. Vivamus ultricies mi eget dui scelerisque, vel tincidunt turpis sodales. Aliquam tincidunt leo nec lacus aliquam mollis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam ut consectetur justo. Suspendisse vel tincidunt turpis. Nam et tincidunt leo. Donec tellus augue, tempor a cursus nec, aliquam sit amet nisi. Morbi sapien leo, semper at egestas sed, ullamcorper sit amet dui. Ut tristique eu orci vel commodo. Nam mollis pellentesque risus a dapibus.
            ''',
            ),
          ],
        ),
      ),
    );
  }
}

class _Aside extends StatelessWidget {
  const _Aside({
    Key? key,
    required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: responsive.value({
        Breakpoints.xs: false,
        Breakpoints.md: true,
      }),
      child: Container(
        width: 200,
        color: Colors.red.shade100,
        child: const Text('Aside'),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      color: Colors.purple.shade900,
      height: 50,
      child: const GridItem(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Footer',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
