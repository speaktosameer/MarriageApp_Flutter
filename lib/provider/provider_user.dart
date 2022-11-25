import 'package:flutter/cupertino.dart';
import 'package:marriage/data/model/user_provider_model.dart';
import 'package:marriage/process_response.dart';
import 'package:marriage/provider/user_controller_profile.dart';

class ProviderUser extends ChangeNotifier {

  List<UserProvider> user = <UserProvider>[];

  final UserProviderController _dbUserController = UserProviderController();

  Future<ProcessResponse> creat(UserProvider Model) async {
    int index = user.indexWhere((element) {
      return element.firstName == Model.firstName;
    });
    int newRow = await _dbUserController.creat(Model);
    if (index == -1) {
      if (newRow != 0) {
        Model.id = newRow;
        user.add(Model);
        notifyListeners();
      }
    }
    return getResponse(newRow != 0);
  }

  // void read() async {
  // user = await _dbUserController.read();
  // notifyListeners();
  // }

  Future<ProcessResponse> clear()async{
  await _dbUserController.clear();
  notifyListeners();
  print (getResponse);
  return getResponse(true);
  }
  ProcessResponse getResponse(bool succsess) {
  return ProcessResponse(
  massage: succsess ? "Opration Succsessful " : "Failed",
  succsess: !succsess);
  }
  Future<ProcessResponse> delete(int index)async{
  await _dbUserController.delete(index);
  notifyListeners();
  print (getResponse);
  return getResponse(true);
  }



}