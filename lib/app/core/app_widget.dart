import 'package:flutter/material.dart';
import 'package:personal_finance_app/app/pages/history/history_page.dart';
import 'package:personal_finance_app/app/pages/home/home_page.dart';
import 'package:personal_finance_app/app/pages/login/login_page.dart';
import 'package:personal_finance_app/app/pages/splash/splash_page.dart';

import 'constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: Kpages.splash.route,
      navigatorKey: kGlobalKeyNavigator,
      scaffoldMessengerKey: kSnackbarKey,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.indigo,
      ),
    );
  }
}

Map<String, WidgetBuilder> routes = {
  Kpages.home.route: (_) => const HomePage(),
  Kpages.splash.route: (_) => const SplashPage(),
  Kpages.history.route: (_) => const HistoryPage(),
  Kpages.login.route: (_) => const LoginPage(),
};
