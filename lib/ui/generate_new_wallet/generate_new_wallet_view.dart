import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'generate_new_wallet_viewmodel.dart';

class GenerateNewWalletView extends StatelessWidget {
  const GenerateNewWalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GenerateNewWalletViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              TextField(
                controller: model.nameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: model.hintNameText,
                ),
              ),
              ElevatedButton(
                onPressed: model.onNewWallet,
                child: Text(model.buttonText),
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => GenerateNewWalletViewModel(),
    );
  }
}
