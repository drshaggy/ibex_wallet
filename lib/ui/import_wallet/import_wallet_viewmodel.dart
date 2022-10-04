import 'package:flutter/material.dart';
import 'package:ibex_wallet/app/app.locator.dart';
import 'package:ibex_wallet/app/logging/logger.dart';
import 'package:ibex_wallet/services/wallet_service.dart';
import 'package:ibex_wallet/services/web3_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:web3dart/web3dart.dart';

import '../../app/string_constants.dart';
import '../../models/wallet.dart';

class ImportWalletViewModel extends BaseViewModel {
  Logger log = getLogger('ImportWalletView');
  final _web3Service = locator<Web3Service>();
  final _walletService = locator<WalletService>();

  String title = importWalletTitle;
  String hintText = importWalletHintText;
  String buttonText = importWalletButtonText;

  TextEditingController seedController = TextEditingController();

  Future onImportWallet() async {
    log.d('Import Wallet Button Pressed');
    if (_web3Service.validateMnemonic(seedController.text)) {
      String privateKey = await _web3Service.getPrivateKey(seedController.text);
      EthereumAddress publicKey = await _web3Service.getPublicKey(privateKey);
      log.d('Wallet $publicKey found');
      UserWallet wallet = UserWallet(
        id: 0,
        mnemonic: seedController.text,
        privateKey: privateKey,
        publicKey: publicKey,
      );
      _walletService.registerWalletWithService(wallet);
      _walletService.registerWalletInDatabase(wallet);
    } else {
      log.d('Invalid Wallet');
    }
  }
}
