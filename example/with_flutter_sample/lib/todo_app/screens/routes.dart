import './home_screen/home_screen.dart';

const appRoutesNamespace = 'todo-app';

var todoAppRoutes = {
  '/$appRoutesNamespace': (context) => const HomeScreen(),
};
