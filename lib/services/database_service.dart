import 'package:ibex_wallet/app/app.locator.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';
import 'package:web3dart/web3dart.dart';
import '../app/logging/logger.dart';
import '../models/wallet.dart';

const String dbName = 'ibex_wallet.sqlite';

class DatabaseService {
  final log = getLogger('DatabaseService');
  final _migrationService = locator<DatabaseMigrationService>();
  late Database _database;

  Future initialise() async {
    String path = await getDatabasesPath();
    log.d("Database Initialising at $path");
    _database = await openDatabase(
      join(path, dbName),
      version: 1,
    );
    await _migrationService.runMigration(
      _database,
      migrationFiles: [
        '1_create_schema.sql',
        '2_create_schema.sql',
      ],
      verbose: true,
    );
    log.d("Database initialised");
  }

  Future<void> insertWallet(UserWallet wallet) async {
    await _database.insert(
      'wallets',
      wallet.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteWallet(UserWallet wallet) async {
    int id = wallet.id;
    await _database.delete(
      'wallets',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<UserWallet>> retrieveWallets() async {
    final List<Map<String, dynamic>> maps = await _database.query('wallets');

    return List.generate(
      maps.length,
      (index) => UserWallet(
        id: maps[index]['id'],
        mnemonic: maps[index]['mnemonic'],
        privateKey: maps[index]['privateKey'],
        publicKey: EthereumAddress.fromHex(maps[index]['publicKey']),
      ),
    );
  }
}
