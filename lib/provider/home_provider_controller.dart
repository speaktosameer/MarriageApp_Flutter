import 'dart:convert';
import 'dart:io';
import 'package:marriage/api_integration/api_setting.dart';
import 'package:marriage/data/controller/shared_pref_controlledr.dart';
import 'package:http/http.dart' as http;
import 'package:marriage/data/model/top_user_model.dart';
import 'package:marriage/data/model/user.dart';
import '../data/model/short_list.dart';
import '../data/model/top_user.dart';

class HomeController{

  static  String token = SharedPrefController()
      .getValueForKey<String>(prefKey.token.name)!;
  static Map<String, String> getTokenHeaders() {
    Map<String, String> headers = new Map();
    headers['Authorization'] = token;
    headers['content-type'] = 'application/json';
    return headers;
  }


  Future<List<TopUser>> getTopUser() async{
    Uri uri = Uri.parse(ApiSetting.topUsers);
   print("first leave");
    var response =await http.get(uri , headers: {
      HttpHeaders.authorizationHeader :token,
      HttpHeaders.acceptHeader: 'application/json',
    });
    print("Response code malsa ${response.statusCode}");
    if(response.statusCode == 200 ){
      var jason = jsonDecode(response.body);
      var dataJeson = jason['data']['filteredUser'] as List;

      return dataJeson.map((dataJeson) => TopUser.fromJson(dataJeson)).toList();

    }
    return [];
  }

  Future<List<Data>> getShortList() async{
    Uri uri = Uri.parse(ApiSetting.shortList);
    var response =await http.get(uri , headers: {
      HttpHeaders.authorizationHeader :token,
      HttpHeaders.acceptHeader: 'application/json',
    }
    );
    print("Response code malsa ${response.statusCode}");
    if(response.statusCode == 201 ){
      var jason = jsonDecode(response.body);
      var dataJeson = jason['data'] as List;
      print(jason['status']);
      return dataJeson.map((dataJeson) => Data.fromJson(dataJeson)).toList();

    }
    return [];
  }




  Future<List<Data>> getUserDetils() async{
    Uri uri = Uri.parse(ApiSetting.shortList);

    var response =await http.get(uri , headers: {
      HttpHeaders.authorizationHeader :token,
      HttpHeaders.acceptHeader: 'application/json',
    });
    if(response.statusCode == 200 ){
      var jason = jsonDecode(response.body);
      var dataJeson = jason['data'] as List;

      return dataJeson.map((dataJeson) => Data.fromJson(dataJeson)).toList();

    }
    return [];
  }


}