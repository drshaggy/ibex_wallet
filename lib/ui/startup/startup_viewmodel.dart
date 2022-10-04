import 'package:ibex_wallet/app/app.locator.dart';
import 'package:ibex_wallet/app/logging/logger.dart';
import 'package:ibex_wallet/services/database_service.dart';
import 'package:ibex_wallet/services/wallet_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.router.dart';
import '../../models/wallet.dart';

class StartUpViewModel extends BaseViewModel {
  Logger log = getLogger('StartUpView');
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();
  final _walletService = locator<WalletService>();
  String title = 'Startup';

  Future initialise() async {
    await _databaseService.initialise();
    List<UserWallet> wallets = await _databaseService.retrieveWallets();
    if (wallets.isEmpty) {
      await _navigationService.replaceWith(Routes.newWalletView);
    } else {
      _walletService.setActiveWallet(wallets[0]);
      await _navigationService.replaceWith(Routes.homeView);
    }
    notifyListeners();
  }
}
