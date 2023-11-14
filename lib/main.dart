import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:personal_finance_app/app/core/app_widget.dart';
import 'package:personal_finance_app/app/models/history/history_model.dart';
import 'package:personal_finance_app/app/models/user/user_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(HistoryModelAdapter());

  runApp(const ProviderScope(child: App()));
}
