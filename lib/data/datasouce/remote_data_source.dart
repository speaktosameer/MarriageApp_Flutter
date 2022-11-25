import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marriage/data/core/api_client.dart';
import 'package:marriage/data/model/login_info_model.dart';
import 'package:marriage/data/model/login_model.dart';
import 'package:marriage/data/model/login_model_response.dart';
import 'package:marriage/data/model/partner_preference_model.dart';
import 'package:marriage/data/model/partner_preference_response_model.dart';
import 'package:marriage/data/model/register_model.dart';
import 'package:marriage/data/model/register_response.dart';
import 'package:marriage/data/model/short_list_model.dart';
import 'package:marriage/data/model/top_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/config.dart';

abstract class RemoteDataSource {
  Future<PartnerPrefenceResponse> postpreference(
      {required PartnerPreference partnerPreference});
  Future<TopUserModel> gettopUser();
  Future<List<ShortList>> getshortList();
  Future<LoginInfoModel> getUser({required String data});
  Future<RegisterResponse> postUser({required RegisterModel registerModel});
  Future<LoginModelResponse> postlogin({required LoginModel loginModel});
}

class RegisterdataSourceImpl implements RemoteDataSource {
  RegisterdataSourceImpl(this.apiclient);
  Apiclient apiclient;

  @override
  Future<RegisterResponse> postUser(
      {required RegisterModel registerModel}) async {
    final result = await apiclient.request(
      endpoint: Config.registeruser,
      method: 'post',
      data: registerModel.toJson(),
    );
    log(registerModel.toString());

    return RegisterResponse.fromjson(result);
  }

  @override
  Future<LoginModelResponse> postlogin({required LoginModel loginModel}) async {
    final result = await apiclient.request(
        endpoint: Config.loginuser, method: 'post', data: loginModel.tojson());

    return LoginModelResponse.fromJson(result);
  }

  @override
  Future<LoginInfoModel> getUser({required String data}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('user_id');

    // const String id = 'd404ce0b-6364-4f09-833e-d410d3d8fc43';

    final result = await apiclient.request(endpoint: Config.userinfo + data!);

    return LoginInfoModel.fromJson(result);
  }

  @override
  Future<TopUserModel> gettopUser() async {
    final result = await apiclient.request(endpoint: Config.topuser);
    final output = result['data'];
    return TopUserModel.formjson(output);
  }

  @override
  Future<List<ShortList>> getshortList() async {
    final result = await apiclient.request(endpoint: Config.shortlistUser);
    final List data = result['data'];

    return data.map((e) => ShortList.fromjson(e)).toList();
  }

  @override
  Future<PartnerPrefenceResponse> postpreference(
      {required PartnerPreference partnerPreference}) async {
    final result = await apiclient.request(
        endpoint: Config.partnerPrefs,
        method: 'post',
        data: partnerPreference.tojson());
    log(result.toString());
    return PartnerPrefenceResponse.fromjson(result);
  }
}

final registerdataSourceprovider = Provider((ref) {
  return RegisterdataSourceImpl(ref.watch(apiclientprovider));
});
