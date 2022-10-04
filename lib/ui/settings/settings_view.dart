import 'package:flutter/material.dart';
import 'package:ibex_wallet/ui/menu/menu_view.dart';
import 'package:ibex_wallet/ui/settings/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        drawer: const MenuView(),
        body: ListView(
          padding: const EdgeInsets.only(
            top: 5,
            bottom: 5,
          ),
          children: [
            ListTile(
              title: Wrap(
                spacing: 10,
                children: [
                  Icon(model.walletsIcon),
                  Text(model.walletsText),
                ],
              ),
              onTap: () => model.onTapWallets(),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => SettingsViewModel(),
    );
  }
}
