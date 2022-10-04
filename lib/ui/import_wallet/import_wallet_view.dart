import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'import_wallet_viewmodel.dart';

class ImportWalletView extends StatelessWidget {
  const ImportWalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ImportWalletViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(
                controller: model.seedController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: model.hintText,
                ),
              ),
              ElevatedButton(
                onPressed: model.onImportWallet,
                child: Text(model.buttonText),
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => ImportWalletViewModel(),
    );
  }
}
