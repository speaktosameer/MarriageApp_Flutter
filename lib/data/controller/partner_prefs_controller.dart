import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:marriage/data/model/partner_preference_model.dart';
import 'package:marriage/data/model/partner_preference_response_model.dart';
import 'package:marriage/data/repositiory/repository.dart';
import 'package:marriage/login/login.dart';

class PartnberPrefsNotifier
    extends StateNotifier<AsyncValue<PartnerPrefenceResponse>> {
  PartnberPrefsNotifier(this.registerRepository)
      : super(const AsyncValue.loading());
  RegisterRepository registerRepository;

  postPrefs(PartnerPreference partnerPreference, BuildContext context) async {
    final result = await registerRepository.postpartnerPrefs(partnerPreference);

    log(result.toString());
    return result.fold(
      (l) => state = AsyncValue.error(l),
      (r) {
        Navigator.of(context)
            .pushReplacement(CupertinoPageRoute(builder: (context) {
          return const Login();
        }));
      },
    );
  }
}

final partnberprefsnotifierprovider = StateNotifierProvider<
    PartnberPrefsNotifier, AsyncValue<PartnerPrefenceResponse>>((ref) {
  return PartnberPrefsNotifier(ref.watch(registerrepoprovider));
});
