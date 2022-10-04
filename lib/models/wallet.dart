import 'package:web3dart/web3dart.dart';

class UserWallet {
  final int id;
  final String mnemonic;
  final String privateKey;
  final EthereumAddress publicKey;

  const UserWallet({
    required this.id,
    required this.mnemonic,
    required this.privateKey,
    required this.publicKey,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mnemonic': mnemonic,
      'privateKey': privateKey,
      'publicKey': publicKey.toString(),
    };
  }

  @override
  String toString() {
    return 'Wallet{id: $id, mnemonic: $mnemonic, privateKey: $privateKey, publicKey: $publicKey}';
  }
}
