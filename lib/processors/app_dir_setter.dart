import 'dart:io';
import 'package:minprom_of_omsk_signal/container/container_extender.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_action.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_extractable.dart';
import 'package:path_provider/path_provider.dart';

class SetAppDir extends IAction {
  @override
  void action(IExtractable? arg) async {
    Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    ContainerExtender.extend(valueContainer, 'appDataHistoryDir', appDocumentsDir);
  }
}
