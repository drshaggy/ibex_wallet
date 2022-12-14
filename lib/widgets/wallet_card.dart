import 'package:flutter/material.dart';

class WalletCard extends StatefulWidget {
  final String deleteText = 'Delete';
  final String publicKey;
  final Function onTap;

  const WalletCard({
    super.key,
    required this.publicKey,
    required this.onTap,
  });

  @override
  // ignore: library_private_types_in_public_api
  _WalletCardState createState() => _WalletCardState();
}

class _WalletCardState extends State<WalletCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            ListTile(
              title: const Text('Title'),
              subtitle: Text(widget.publicKey),
              trailing: PopupMenuButton(
                onSelected: ((value) {
                  switch (value) {
                    case 0:
                      widget.onTap();
                      break;
                  }
                }),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    child: Text(widget.deleteText),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
