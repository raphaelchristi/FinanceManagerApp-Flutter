import 'package:personal_finance_app/app/models/user/user_model.dart';
import 'package:riverpod/riverpod.dart';

final userProvider = StateNotifierProvider<UserProviderNotifier, UserModel>((
  ref,
) {
  return UserProviderNotifier();
});

enum UserFieldEnum {
  name,
  salary,
  objective,
}

class UserProviderNotifier extends StateNotifier<UserModel> {
  UserProviderNotifier() : super(UserModel());

  void setPropByField(UserFieldEnum field, String value) {
    switch (field) {
      case UserFieldEnum.name:
        state = state.copyWith(name: value);
        return;
      case UserFieldEnum.salary:
        state = state.copyWith(salary: double.parse(value));
        return;
      case UserFieldEnum.objective:
        state = state.copyWith(reservation: double.parse(value));
        return;
    }
  }
}
