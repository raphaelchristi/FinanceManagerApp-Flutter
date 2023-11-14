import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:personal_finance_app/app/core/constants.dart';
import 'package:personal_finance_app/app/models/user/user_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const SizedBox(height: 80),
          ElevatedButton(
              onPressed: () async {
                final box = await Hive.openBox<UserModel>(kUserBox);
                print(box.values.first.toMap());
              },
              child: const Text('mostrar')),
          const Text('iniciio'),
        ],
      )),
    );
  }
}
