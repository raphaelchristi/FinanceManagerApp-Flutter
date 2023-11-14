import 'package:flutter/material.dart';
import 'package:personal_finance_app/app/pages/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: '/home',
    );
  }
}

Map<String, WidgetBuilder> routes = {'/home': (_) => const HomePage()};
