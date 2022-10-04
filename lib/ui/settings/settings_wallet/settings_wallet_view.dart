import 'package:flutter/material.dart';
import 'package:ibex_wallet/ui/menu/menu_view.dart';
import 'package:ibex_wallet/ui/settings/settings_wallet/settings_wallet_viewmodel.dart';
import 'package:ibex_wallet/widgets/wallet_card.dart';
import 'package:stacked/stacked.dart';

class SettingsWalletView extends StatelessWidget {
  const SettingsWalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsWalletViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            model.title,
          ),
        ),
        drawer: const MenuView(),
        body: Center(
          child: ListView(
            children: [
              WalletCard(
                publicKey: model.publicKey,
                onTap: () => model.onTapDelete(),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SettingsWalletViewModel(),
      onModelReady: (model) => model.initialise(),
    );
  }
}
