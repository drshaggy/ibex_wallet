import 'package:flutter/material.dart';
import 'package:ibex_wallet/app/app.locator.dart';
import 'package:ibex_wallet/app/logging/logger.dart';
import 'package:ibex_wallet/services/wallet_service.dart';
import 'package:ibex_wallet/services/web3_service.dart';
import 'package:oktoast/oktoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:web3dart/web3dart.dart';
import '../../app/app.router.dart';
import '../../app/string_constants.dart';
import '../../models/wallet.dart';

class GenerateNewWalletViewModel extends BaseViewModel {
  final log = getLogger('GenerateNewWalletView');
  final _web3Service = locator<Web3Service>();
  final _walletService = locator<WalletService>();
  final _navigationService = locator<NavigationService>();

  String hintNameText = importWalletNameHintText;
  String buttonText = 'New Wallet';

  TextEditingController nameController = TextEditingController();

  Future<void> onNewWallet() async {
    log.d('Import Wallet Button Pressed');
    String mnemonic = _web3Service.generateMnemonic();
    if (_web3Service.validateMnemonic(mnemonic)) {
      String privateKey = await _web3Service.getPrivateKey(mnemonic);
      EthereumAddress publicKey = await _web3Service.getPublicKey(privateKey);
      log.d('Wallet $publicKey found');

      UserWallet wallet = UserWallet(
        name: nameController.text,
        mnemonic: mnemonic,
        privateKey: privateKey,
        publicKey: publicKey,
      );
      _walletService.registerNewWallet(wallet);
      _navigationService.clearStackAndShow(Routes.homeView);
    } else {
      showToast(
        'Invalid Wallet, please try again',
        position: ToastPosition.bottom,
      );
      log.d('Invalid Wallet');
    }
  }
}
