import 'dart:developer';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart' as path;
import 'package:projcet_merakkel/App/Models/UserModel.dart';
import 'package:projcet_merakkel/App/Models/WalletModel.dart';

class LocalDbServices {
  late Future<Isar> db;


  LocalDbServices() {
    db = openDb();



  }

  Future<Isar> openDb() async {
    if (Isar.instanceNames.isEmpty) {
      final directory = path.join((await getApplicationDocumentsDirectory()).path);
      log(directory);  // Log the directory path
      return await Isar.open([WalletModelSchema,UserModelSchema], directory: directory, inspector: true);
    } else {
      return Future.value(Isar.getInstance());
    }
  }



  Future<void> SaveWallet(WalletModel walletModel) async {
    final isar = await db;
    isar .writeTxn(() => isar.walletModels.put(walletModel));
    log('Save data');  // Log a message when saving data
  }

  Stream<List<WalletModel>> getWallets() async* {
    final isar = await db;
   yield* isar.walletModels.where(). watch(fireImmediately: true);
  }


  Future<void> SaveUser(UserModel userModel) async {
    final isar = await db;
    isar .writeTxn(() => isar.userModels.put(userModel));
    log('Save data');  // Log a message when saving data
  }
  Stream<List<UserModel>> getUsers() async* {
    final isar = await db;
    yield* isar.userModels.where(). watch(fireImmediately: true);
  }


}
