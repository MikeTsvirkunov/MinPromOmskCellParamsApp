import 'dart:convert';
import 'dart:io';

import 'package:minprom_of_omsk_signal/checkers/require_premission.dart';
import 'package:minprom_of_omsk_signal/container/container_extender.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/constant_container.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';
import 'package:path_provider/path_provider.dart';

Future<void> onStartInitiation() async {
  await askLocationPermission();
  Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  ContainerExtender.extend(valueContainer, 'appDataHistoryDir', appDocumentsDir);
  String historyFileName = ContainerExtractor.extract<String>(constantContainer, 'historyFileName');
  String path = '${ContainerExtractor.extract<Directory>(valueContainer, 'appDataHistoryDir').path}/$historyFileName';
  String key = 'historyData';
  final File file = File(path);
  if (await file.exists()) {
    ContainerExtender.extend(valueContainer, key, jsonDecode(await file.readAsString()));
  } else {
    ContainerExtender.extend(valueContainer, key, {'data': []});
  }
}