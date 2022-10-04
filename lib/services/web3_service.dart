import 'package:hex/hex.dart';
import 'package:ibex_wallet/app/logging/logger.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:web3dart/web3dart.dart';

class Web3Service {
  final log = getLogger('Web3Service');

  String generateMnemonic() => bip39.generateMnemonic();

  Future<String> getPrivateKey(String mnemonic) async {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
    final privateKey = HEX.encode(master.key);
    return privateKey;
  }

  Future<EthereumAddress> getPublicKey(String privateKey) async {
    final private = EthPrivateKey.fromHex(privateKey);
    final address = await private.extractAddress();
    log.d('Address: $address');
    return address;
  }

  bool validateMnemonic(String mnemonic) => bip39.validateMnemonic(mnemonic);
}
