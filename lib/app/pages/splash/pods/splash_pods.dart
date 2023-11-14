import 'package:hive/hive.dart';
import 'package:personal_finance_app/app/core/constants.dart';
import 'package:personal_finance_app/app/core/knavigator.dart';
import 'package:personal_finance_app/app/models/user/user_model.dart';
import 'package:riverpod/riverpod.dart';

final hasLoginProvider = FutureProvider<void>((ref) async {
  final box = await Hive.openBox<UserModel>(kUserBox);
  await Future.delayed(const Duration(seconds: 1));
  if (box.values.isNotEmpty) {
    KNavigator().removeAllAndPush(Kpages.home);
  } else {
    KNavigator().removeAllAndPush(Kpages.login);
  }
});
