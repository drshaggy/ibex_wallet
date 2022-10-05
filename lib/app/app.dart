import 'package:ibex_wallet/services/wallet_service.dart';
import 'package:ibex_wallet/services/web3_service.dart';
import 'package:ibex_wallet/ui/generate_new_wallet/generate_new_wallet_view.dart';
import 'package:ibex_wallet/ui/import_wallet/import_wallet_view.dart';
import 'package:ibex_wallet/ui/new_wallet/new_wallet_view.dart';
import 'package:ibex_wallet/ui/settings/settings_view.dart';
import 'package:ibex_wallet/ui/settings/settings_wallet/settings_wallet_view.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/database_service.dart';
import '../ui/home/home_view.dart';
import '../ui/startup/startup_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: NewWalletView),
    MaterialRoute(page: ImportWalletView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: SettingsWalletView),
    MaterialRoute(page: GenerateNewWalletView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DatabaseService),
    LazySingleton(classType: Web3Service),
    LazySingleton(classType: WalletService),
    LazySingleton(classType: DatabaseMigrationService),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}

//flutter pub run build_runner build --delete-conflicting-outputs