import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'new_wallet_viewmodel.dart';

class NewWalletView extends StatelessWidget {
  const NewWalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewWalletViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        body: Center(
          child: Column(
            children: [
              Text(model.description),
              ElevatedButton(
                onPressed: model.onNewButtonPressed,
                child: Text(model.newButtonText),
              ),
              ElevatedButton(
                onPressed: model.onImportButtonPressed,
                child: Text(model.importButtonText),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => NewWalletViewModel(),
    );
  }
}
