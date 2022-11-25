import 'package:marriage/data/database.dart';
import 'package:marriage/data/model/user_provider_model.dart';
import 'package:sqflite/sqflite.dart';

class UserProviderController{

  final Database database  =DbController().database;

  @override
  Future<int> creat(UserProvider model) async{
    int row =  await database.insert(UserProvider.tableName ,
        model.toMap() );
    return row;
  }
  @override
  Future<int> delete(int index)async {
    int rowDelet = await database.delete(UserProvider.tableName
        , where: 'id =?' ,whereArgs: [index]);
    return rowDelet;
  }

  @override
  Future<List<UserProvider>> read(int index)async {
    List<Map<String, dynamic>> userProvider =
    await database.query(UserProvider.tableName ,where: 'id=?' ,whereArgs: [index]);
    return userProvider.map((userProvider) =>
        UserProvider.fromMap(userProvider)).toList();
  }


  @override
  Future<UserProvider?> show(int id) {
    // TODO: implement show
    // TODO: implement show
    throw UnimplementedError();
  }

  @override
  Future<bool> update(UserProvider model) async {
    int rowMap = await database.update(UserProvider.tableName, model.toMap()
        ,where: 'id =? ' ,whereArgs: [model.id]);
    return rowMap ==1;
  }

  Future<void> clear ()async{
    await database.delete(UserProvider.tableName);
  }
}
