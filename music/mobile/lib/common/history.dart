// save what was last played in db 
import 'package:isar/isar.dart';
import 'package:mobile/common/user.dart';


part 'history.g.dart';

@collection
//songs within history 
class History {
  Id id = Isar.autoIncrement;
  String? songTitle;
  String? artist;
  bool? liked;

  @Backlink(to: "User")
  final user = IsarLink<User>();
}
