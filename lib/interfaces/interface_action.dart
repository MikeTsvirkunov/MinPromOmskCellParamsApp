import 'package:minprom_of_omsk_signal/interfaces/interface_extractable.dart';

abstract class IAction{
  void action(IExtractable? arg);
}

abstract class IActionAsync {
  Future<void> action(IExtractable? arg) async {}
}
