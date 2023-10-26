import 'dart:developer';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart' as path;
import 'package:projcet_merakkel/App/Models/WalletModel.dart';

class LocalDbServices {
  late Future<Isar> db;
  late Future<Isar> userDb;

  LocalDbServices() {
    db = openDb();
    userDb = UserDb();


  }

  Future<Isar> openDb() async {
    if (Isar.instanceNames.isEmpty) {
      final directory = path.join((await getApplicationDocumentsDirectory()).path);
      log(directory);  // Log the directory path
      return await Isar.open([WalletModelSchema], directory: directory, inspector: true);
    } else {
      return Future.value(Isar.getInstance());
    }
  }

 Future<Isar> UserDb() async {
    if (Isar.instanceNames.isEmpty) {
      final directory = path.join((await getApplicationDocumentsDirectory()).path);
      log(directory);  // Log the directory path
      return await Isar.open([], directory: directory, inspector: true);
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

}
