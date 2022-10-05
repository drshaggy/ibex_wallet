import 'package:ibex_wallet/app/app.locator.dart';
import 'package:ibex_wallet/services/database_service.dart';
import '../models/wallet.dart';

class WalletService {
  late UserWallet activeWallet;
  List<UserWallet> wallets = List<UserWallet>.empty(growable: true);

  final _databaseService = locator<DatabaseService>();

  void registerNewWallet(UserWallet wallet) {
    activeWallet = wallet;
    wallets.add(wallet);
    _databaseService.insertWallet(wallet);
  }

  void setActiveWallet(UserWallet wallet) {
    activeWallet = wallet;
  }

  void removeWallet(UserWallet wallet) {
    wallets.removeWhere((element) => element.publicKey == wallet.publicKey);
    _databaseService.deleteWallet(wallet);
  }
}
