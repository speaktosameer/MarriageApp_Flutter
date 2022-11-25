class UserProvider {
  static const  tableName = 'users';

  int id = 0;
  String firstName = "" ;
  String lastName = "" ;
  String email = "" ;
  String mobileNumber = "" ;
  String password = "" ;
  int age = 0 ;


  UserProvider();

  //read Data From DataBase
  UserProvider.fromMap(Map<String, dynamic> rowMap) {
    this.firstName = rowMap['firstName'];
    this.lastName = rowMap['lastName'];
    this.email = rowMap['email'];
    this.id = rowMap['id'];
    this.mobileNumber = rowMap['mobile'];
    this.password = rowMap['password'];
    this.age = rowMap['age'];

  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> rowMap = <String, dynamic>{};
   rowMap['firstName'] = this.firstName ;
   rowMap['lastName'] =  this.lastName;
     rowMap['email'] =this.email;
    rowMap['mobile'] =this.mobileNumber ;
     rowMap['password'] =this.password;
    rowMap['age'] =this.age ;
    return rowMap;
  }
}