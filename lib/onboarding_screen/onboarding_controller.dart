import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marriage/local/db_client.dart';
import 'package:marriage/onboarding_screen/onboarding_state.dart';

final onboardingControllerProvider =
    StateNotifierProvider<OnboardingControllerNotifier, OnboardingState>((ref) {
  return OnboardingControllerNotifier(ref.watch(dbClientProvider));
});

class OnboardingControllerNotifier extends StateNotifier<OnboardingState> {
  OnboardingControllerNotifier(this.dbclient)
      : super(const OnboardingState.loading()) {
    check();
  }

  final Dbclient dbclient;
  check() async {
    final result = await dbclient.getData('isVisited', DbDataType.bool);
    state = result == null
        ? const OnboardingState.unvisited()
        : const OnboardingState.visited();
  }

  visited() async {
    await dbclient.setData(
        dataType: DbDataType.bool, key: 'isVisited', value: true);
  }
}
