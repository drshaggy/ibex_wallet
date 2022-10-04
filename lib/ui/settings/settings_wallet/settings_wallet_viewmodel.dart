import 'package:ibex_wallet/app/app.locator.dart';
import 'package:ibex_wallet/app/logging/logger.dart';
import 'package:ibex_wallet/models/wallet.dart';
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
    publicKey = _walletService.publicKey.toString();
  }

  void onTapDelete() {
    log.d('onTapDelete Pressed');
    var id = _walletService.id;
    var mnemonic = _walletService.mnemonic;
    var privateKey = _walletService.privateKey;
    var publicKey = _walletService.publicKey;
    UserWallet wallet = UserWallet(
      id: id,
      mnemonic: mnemonic,
      privateKey: privateKey,
      publicKey: publicKey,
    );
    _databaseService.deleteWallet(wallet);
  }
}
