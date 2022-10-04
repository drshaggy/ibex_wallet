import 'package:flutter/material.dart';
import 'package:ibex_wallet/app/app.locator.dart';
import 'package:ibex_wallet/app/app.router.dart';
import 'package:ibex_wallet/app/logging/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MenuViewModel extends BaseViewModel {
  final log = getLogger('MenuView');
  final _navigationService = locator<NavigationService>();
  String title = 'Menu';
  var color = Colors.yellow;

  String settingsText = 'Settings';

  void onTapSettings() {
    log.d('Settings pressed');
    _navigationService.popRepeated(1);
    _navigationService.navigateTo(Routes.settingsView);
  }
}
