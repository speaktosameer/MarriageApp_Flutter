import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marriage/data/model/top_user_model.dart';
import 'package:marriage/data/repositiory/repository.dart';

class UserNotifier extends StateNotifier<AsyncValue<TopUserModel>> {
  UserNotifier(this.registerRepository) : super(const AsyncValue.loading()) {
    gettopUser();
  }
  RegisterRepository registerRepository;
  gettopUser() async {
    final result = await registerRepository.gettopUser();

    result.fold(
        (l) => state = AsyncValue.error(l), (r) => state = AsyncValue.data(r));
  }
}

final topuserInfoProvider =
    StateNotifierProvider<UserNotifier, AsyncValue<TopUserModel>>((ref) {
  return UserNotifier(ref.watch(registerrepoprovider));
});
