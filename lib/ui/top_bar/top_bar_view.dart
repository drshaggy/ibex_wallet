import 'package:flutter/material.dart';
import 'package:ibex_wallet/ui/top_bar/top_bar_viewmodel.dart';
import 'package:stacked/stacked.dart';

class TopBarView extends StatelessWidget {
  const TopBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TopBarViewModel>.reactive(
      builder: (context, model, child) => AppBar(
        title: Text(model.title),
      ),
      viewModelBuilder: () => TopBarViewModel(),
    );
  }
}
