import 'dart:io';

import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/container/default_container.dart';
import 'package:minprom_of_omsk_signal/global_values/constant_container.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_action.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_extractable.dart';

class SetHistoryData extends IAction {
  @override
  void action(IExtractable? arg) async {
    String historyFileName = ContainerExtractor.extract<String>(constantContainer, 'historyFileName');
    String path = '${ContainerExtractor.extract<Directory>(valueContainer, 'appDataHistoryDir').path}/$historyFileName';
    String key = 'historyData';
    ContainerExtractor.extract<IAction>(constantContainer, 'SetLoadedData').action(DefaultContainer({'path': path, 'key': key}));
  }
}