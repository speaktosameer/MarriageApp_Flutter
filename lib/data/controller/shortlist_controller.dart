import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marriage/data/model/short_list_model.dart';
import 'package:marriage/data/repositiory/repository.dart';

class UserNotifier extends StateNotifier<AsyncValue<List<ShortList>>> {
  UserNotifier(this.registerRepository) : super(const AsyncValue.loading()) {
    getshortListUser();
  }
  RegisterRepository registerRepository;
  getshortListUser() async {
    final result = await registerRepository.getshortList();

    result.fold(
        (l) => state = AsyncValue.error(l), (r) => state = AsyncValue.data(r));
  }
}

final shortListProvider =
    StateNotifierProvider<UserNotifier, AsyncValue<List<ShortList>>>((ref) {
  return UserNotifier(ref.watch(registerrepoprovider));
});
