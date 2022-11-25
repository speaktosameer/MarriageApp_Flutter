import 'package:marriage/data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login_info_model.dart';
import '../model/userlogin.dart';

enum prefKey{login ,languges ,mobile ,name , lastName ,email
 , password , id ,loggedIn ,fullName ,gender ,token ,cityId}
class SharedPrefController{


  SharedPrefController._();

  late SharedPreferences _sharedPreferences;
  static SharedPrefController? _instance ;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }


  Future<void> inittalShared() async{
    _sharedPreferences =await SharedPreferences.getInstance();
  }

  void save({required UserLogin user})async{
   await  _sharedPreferences.setString(prefKey.id.name , user.user!.userId.toString());
  await  _sharedPreferences.setString(prefKey.email.name ,user.user!.email.toString());
  await  _sharedPreferences.setString(prefKey.fullName.name ,user.user!.firstName.toString());
  await  _sharedPreferences.setString(prefKey.mobile.name ,user.user!.mobileNumber.toString());
  await  _sharedPreferences.setString(prefKey.lastName.name ,user.user!.lastName.toString());
  await  _sharedPreferences.setString(prefKey.token.name ,'Bearer ${user.token}' );
  }

  T? getValueForKey<T>( String key){
    if(_sharedPreferences.containsKey(key)){
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }
void clear()async{
_sharedPreferences.clear();
}
}