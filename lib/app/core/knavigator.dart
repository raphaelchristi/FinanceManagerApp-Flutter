import 'package:flutter/material.dart';

import 'constants.dart';

abstract class NavigatorEnumAdapter {
  String get route;
}

class KNavigator<T> {
  late final NavigatorState _nav;
  final Object? arguments;

  KNavigator({this.arguments}) {
    if (kGlobalKeyNavigator.currentState != null) {
      _nav = kGlobalKeyNavigator.currentState!;
    } else {
      throw Exception('Navigator needs state!');
    }
  }

  void pop([T? value]) {
    _nav.pop(value);
  }

  Future<T?> pushNamed<R extends NavigatorEnumAdapter>(R page) {
    return _nav.pushNamed(page.route, arguments: arguments);
  }

  Future<T?> pushReplacementNamed<R extends NavigatorEnumAdapter>(R page) {
    return _nav.pushReplacementNamed(page.route, arguments: arguments);
  }

  Future<T?> popAndPushNamed<R extends NavigatorEnumAdapter>(R page) {
    return _nav.popAndPushNamed(page.route, arguments: arguments);
  }

  Future<T?> removeAllAndPush<R extends NavigatorEnumAdapter>(R page) {
    return _nav.pushNamedAndRemoveUntil(
      page.route,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }
}
