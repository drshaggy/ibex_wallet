import 'package:web3dart/web3dart.dart';

class UserWallet {
  final String name;
  final String mnemonic;
  final String privateKey;
  final EthereumAddress publicKey;

  const UserWallet({
    required this.name,
    required this.mnemonic,
    required this.privateKey,
    required this.publicKey,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mnemonic': mnemonic,
      'privateKey': privateKey,
      'publicKey': publicKey.toString(),
    };
  }

  @override
  String toString() {
    return 'Wallet{name: $name, mnemonic: $mnemonic, privateKey: $privateKey, publicKey: $publicKey}';
  }
}
