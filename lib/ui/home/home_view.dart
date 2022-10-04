import 'package:flutter/material.dart';
import 'package:ibex_wallet/ui/home/home_viewmodel.dart';
import 'package:ibex_wallet/ui/menu/menu_view.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        drawer: const MenuView(),
        body: Center(
          child: Text(model.title),
        ),
      ),
      onModelReady: (model) => model.initialise,
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
