import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marriage/data/model/login_info_model.dart';
import 'package:marriage/data/repositiory/repository.dart';

class UserNotifier extends StateNotifier<AsyncValue<LoginInfoModel>> {
  UserNotifier(this.registerRepository) : super(const AsyncValue.loading()) {
    getinfo();
  }
  RegisterRepository registerRepository;
  getinfo() async {
    final result = await registerRepository.getInfo();

    result.fold(
        (l) => state = AsyncValue.error(l), (r) => state = AsyncValue.data(r));
  }
}

final userInfoProvider =
    StateNotifierProvider<UserNotifier, AsyncValue<LoginInfoModel>>((ref) {
  return UserNotifier(ref.watch(registerrepoprovider));
});
