import 'package:ibex_wallet/app/app.locator.dart';
import 'package:ibex_wallet/services/database_service.dart';
import 'package:web3dart/web3dart.dart';

import '../models/wallet.dart';

class WalletService {
  late int id;
  late String mnemonic;
  late String privateKey;
  late EthereumAddress publicKey;

  final _databaseService = locator<DatabaseService>();

  void registerWalletWithService(UserWallet wallet) {
    id = wallet.id;
    mnemonic = wallet.mnemonic;
    privateKey = wallet.privateKey;
    publicKey = wallet.publicKey;
  }

  void registerWalletInDatabase(UserWallet wallet) =>
      _databaseService.insertWallet(wallet);
}
