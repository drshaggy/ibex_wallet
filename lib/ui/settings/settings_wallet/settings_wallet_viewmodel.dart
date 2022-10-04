import 'package:ibex_wallet/app/app.locator.dart';
import 'package:ibex_wallet/app/logging/logger.dart';
import 'package:ibex_wallet/services/database_service.dart';
import 'package:ibex_wallet/services/wallet_service.dart';
import 'package:stacked/stacked.dart';

class SettingsWalletViewModel extends BaseViewModel {
  final _walletService = locator<WalletService>();
  final _databaseService = locator<DatabaseService>();
  final log = getLogger('SettingsWalletView');

  String title = 'Wallets';
  String publicKey = "";

  void initialise() {
    publicKey = _walletService.activeWallet.publicKey.toString();
  }

  void onTapDelete() {
    log.d('onTapDelete Pressed');
    _databaseService.deleteWallet(_walletService.activeWallet);
  }
}
