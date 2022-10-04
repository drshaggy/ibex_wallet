import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'menu_viewmodel.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MenuViewModel>.reactive(
      builder: (context, model, child) => Drawer(
        child: ListView(
          padding: const EdgeInsets.only(
            top: 5,
            bottom: 5,
          ),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: model.color,
              ),
              child: Text(model.title),
            ),
            ListTile(
              title: Text(model.settingsText),
              onTap: () => model.onTapSettings(),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => MenuViewModel(),
    );
  }
}
