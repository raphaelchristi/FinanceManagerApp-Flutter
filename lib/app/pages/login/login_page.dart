import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:personal_finance_app/app/core/constants.dart';
import 'package:personal_finance_app/app/models/user/user_model.dart';

import 'pods/login_pods.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Seja Bem-vindo!',
                style: TextStyle(fontSize: 24),
              ),
              const Text(
                'Insira algumas informações para te conhecermos melhor ;)',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                onChanged: (value) {
                  ref.read(userProvider.notifier).setPropByField(
                        UserFieldEnum.name,
                        value,
                      );
                },
                decoration: const InputDecoration(label: Text('Nome *')),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  ref.read(userProvider.notifier).setPropByField(
                        UserFieldEnum.salary,
                        value,
                      );
                },
                decoration: const InputDecoration(label: Text('Salário *')),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  ref.read(userProvider.notifier).setPropByField(
                        UserFieldEnum.objective,
                        value,
                      );
                },
                decoration: const InputDecoration(
                    label: Text('Meta Por Mês (opcional)')),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      UserModel user = ref.watch(userProvider);
                      if (user.name != null && user.salary != null) {
                        //salvar no banco e continuar
                        final box = await Hive.openBox<UserModel>(kUserBox);
                        final saveMethod = box.add(user);
                        //continuar navegação
                        saveMethod.then((value) {
                          Navigator.of(context).pushReplacementNamed(
                            Kpages.home.route,
                          );
                        });
                      } else {
                        kDefaultSnackBar(
                          title: 'Preencha os Campos obrigatórios',
                          context: context,
                        );
                      }
                    },
                    child: const Text('Finalizar')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
