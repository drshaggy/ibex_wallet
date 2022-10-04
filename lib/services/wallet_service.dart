import 'package:ibex_wallet/app/app.locator.dart';
import 'package:ibex_wallet/services/database_service.dart';
import '../models/wallet.dart';

class WalletService {
  late UserWallet activeWallet;
  late List<UserWallet> wallets;

  final _databaseService = locator<DatabaseService>();

  void registerNewWallet(UserWallet wallet) {
    activeWallet = wallet;
    _databaseService.insertWallet(wallet);
  }

  void setActiveWallet(UserWallet wallet) {
    activeWallet = wallet;
  }
}
