// import 'package:isar/isar.dart';
// import 'package:mobile/common/history.dart';

// class IsarService {
//   late Future<Isar> db;
// }


// IsarServive(){
//   db = openDB();
// }


// Future<Isar> openDB() async{
//   if(Isar.instanceNames.isEmpty){
//     return await Isar.open(
//       [HistorySchema],
//       inspector: true, directory: '',
//       );
//   }
// }

// Future<void> saveHistory(History history) async {
//   final isar = await db;
//   isar.writeTxnSync<int>(() => isar.histories.putSync(newHistory));
// }

