import 'package:flutter/material.dart';
import 'package:responsive_styles/responsive_styles.dart';

class ChatAppScreen extends StatelessWidget {
  const ChatAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat App"),
      ),
      body: Container(
        color: Colors.orange.shade100,
        child: const GridItem(
          as: Row,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Aside(),
            _Body(),
          ],
        ),
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

    return Expanded(
      child: Container(
        color: Colors.orange.shade100,
        child: GridView.count(
          //cria um grid com 2 colunas
          crossAxisCount: responsive.value({
            Breakpoints.xs: 1,
            Breakpoints.sm: 2,
            Breakpoints.md: 3,
            Breakpoints.lg: 4,
            Breakpoints.xl: 5,
          }),
          // Gera 100 Widgets que exibem o seu índice na lista
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _Aside extends StatelessWidget {
  const _Aside({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsive = Responsive(context);
    return Visibility(
      visible: responsive.value({
        Breakpoints.xs: false,
        Breakpoints.md: true,
      }),
      child: Container(
        width: 330,
        color: Colors.orange.shade900,
        child: const Center(
          child: Text('Aside'),
        ),
      ),
    );
  }
}
