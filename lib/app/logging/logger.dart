import 'package:ibex_wallet/app/logging/simple_log_printer.dart';
import 'package:logger/logger.dart';

Logger getLogger(String className) {
  return Logger(printer: SimpleLogPrinter(className));
}
