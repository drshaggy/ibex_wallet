import 'package:ibex_wallet/app/app.locator.dart';
import 'package:ibex_wallet/app/logging/logger.dart';
import 'package:ibex_wallet/app/string_constants.dart';
import 'package:ibex_wallet/services/database_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  Logger log = getLogger('HomeViewModel');
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();
  String title = appTitle;

  Future initialise() async {}
}
