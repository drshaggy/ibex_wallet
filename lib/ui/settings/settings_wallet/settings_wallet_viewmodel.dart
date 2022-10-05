import 'package:ibex_wallet/app/app.locator.dart';
import 'package:ibex_wallet/app/app.router.dart';
import 'package:ibex_wallet/app/logging/logger.dart';
import 'package:ibex_wallet/services/wallet_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/wallet.dart';

class SettingsWalletViewModel extends BaseViewModel {
  final _walletService = locator<WalletService>();
  final _navigationService = locator<NavigationService>();
  final log = getLogger('SettingsWalletView');

  String title = 'Wallets';
  String publicKey = "";
  List<UserWallet> wallets = List<UserWallet>.empty();

  void initialise() {
    publicKey = _walletService.activeWallet.publicKey.toString();
    wallets = _walletService.wallets;
  }

  void onTapDelete() {
    log.d('onTapDelete Pressed');
    _walletService.removeWallet(_walletService.activeWallet);

    // Need to add navigation to start up if wallets is empty
    if (_walletService.wallets.isEmpty) {
      log.d('Navigating to newWalletView');
      _navigationService.popRepeated(1);
      _navigationService.clearStackAndShow(Routes.newWalletView);
      notifyListeners();
    }
  }
}
