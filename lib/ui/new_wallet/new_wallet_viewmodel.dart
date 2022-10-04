import 'package:ibex_wallet/app/app.router.dart';
import 'package:ibex_wallet/app/logging/logger.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/string_constants.dart';

class NewWalletViewModel extends BaseViewModel {
  Logger log = getLogger('NewWalletView');
  final _navigationService = locator<NavigationService>();

  String title = newWalletTitle;
  String description = newWalletDescription;
  String newButtonText = newWalletNewButton;
  String importButtonText = newWalletImportButton;

  void onNewButtonPressed() {
    log.d("New Wallet Button Pressed");
  }

  void onImportButtonPressed() {
    log.d("Import Wallet Button Pressed");
    _navigationService.navigateTo(Routes.importWalletView);
  }
}
