import 'package:flutter/material.dart';

import 'knavigator.dart';

enum Kpages implements NavigatorEnumAdapter {
  home,
  splash,
  history,
  login;

  const Kpages();
  @override
  String get route => '/$name';
}

final GlobalKey<ScaffoldMessengerState> kSnackbarKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> kGlobalKeyNavigator =
    GlobalKey<NavigatorState>();
kDefaultSnackBar({
  required String title,
  required BuildContext? context,
  String? message,
  double seconds = 4,
  bool captalize = true,
  Color? color,
  void Function()? onTap,
}) {
  kSnackbarKey.currentState?.showSnackBar(SnackBar(
    elevation: 0,
    duration: Duration(milliseconds: (seconds * 1000).truncate()),
    behavior: SnackBarBehavior.floating,
    // padding: const EdgeInsets.only(bottom: 0),
    clipBehavior: Clip.none,
    backgroundColor: Colors.transparent,
    content: GestureDetector(
      onTap: onTap,
      child: Text(message ?? ''),
    ),
  ));
}

const String kUserBox = 'user';
