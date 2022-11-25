import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marriage/data/core/exception.dart';
import 'package:marriage/data/core/app_error.dart';
import 'package:marriage/data/datasouce/remote_data_source.dart';
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

abstract class RegisterRepository {
  Future<Either<AppError, PartnerPrefenceResponse>> postpartnerPrefs(
      PartnerPreference partnerPreference);
  Future<Either<AppError, RegisterResponse>> postuser(
      RegisterModel registerModel);
  Future<Either<AppError, LoginModelResponse>> postlogin(LoginModel loginModel);
  Future<Either<AppError, LoginInfoModel>> getInfo();
  Future<Either<AppError, TopUserModel>> gettopUser();
  Future<Either<AppError, List<ShortList>>> getshortList();
}

class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRepositoryImpl(this.registerdataSource);
  RemoteDataSource registerdataSource;

  @override
  Future<Either<AppError, RegisterResponse>> postuser(
      RegisterModel registerModel) async {
    try {
      final result =
          await registerdataSource.postUser(registerModel: registerModel);

      return Right(result);
    } on DioError catch (e) {
      return Left(AppError(message: e.message));
    }
  }

  @override
  Future<Either<AppError, LoginModelResponse>> postlogin(
      LoginModel loginModel) async {
    try {
      final result = await registerdataSource.postlogin(loginModel: loginModel);
      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(message: e.message!));
    }
  }

  @override
  Future<Either<AppError, LoginInfoModel>> getInfo() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? output = prefs.getString('user_id');

      final result = await registerdataSource.getUser(data: output!);
      // log(result.toString());
      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(message: e.message!));
    }
  }

  @override
  Future<Either<AppError, TopUserModel>> gettopUser() async {
    try {
      final result = await registerdataSource.gettopUser();

      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(message: e.message!));
    }
  }

  @override
  Future<Either<AppError, List<ShortList>>> getshortList() async {
    try {
      final result = await registerdataSource.getshortList();
      log(result.toString());
      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(message: e.message!));
    }
  }

  @override
  Future<Either<AppError, PartnerPrefenceResponse>> postpartnerPrefs(
      PartnerPreference partnerPreference) async {
    try {
      final result = await registerdataSource.postpreference(
          partnerPreference: partnerPreference);
      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(message: e.message!));
    }
  }
}

final registerrepoprovider = Provider<RegisterRepository>((ref) {
  return RegisterRepositoryImpl(ref.watch(registerdataSourceprovider));
});
