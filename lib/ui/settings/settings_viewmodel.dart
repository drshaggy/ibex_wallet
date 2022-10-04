import 'package:flutter/material.dart';
import 'package:ibex_wallet/app/app.locator.dart';
import 'package:ibex_wallet/app/app.router.dart';
import 'package:ibex_wallet/app/app_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  String title = 'Settings';

  IconData walletsIcon = AppIcon().walletIcon;
  String walletsText = 'Wallets';

  void onTapWallets() =>
      _navigationService.navigateTo(Routes.settingsWalletView);
}
