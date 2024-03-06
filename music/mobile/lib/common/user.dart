import 'package:isar/isar.dart';

import 'history.dart';

part 'user.g.dart';

// @collection
// class user {
//     Id id = Isar.autoIncrement; 
    
//   String email;
//   String username;
//   String password;



// }


@collection 
class User {
  Id id = Isar.autoIncrement;
  String? username;
  bool? darkMode;


  @Backlink(to: "History")
  final history = IsarLink<History>();

}