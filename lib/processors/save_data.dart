import 'dart:convert';
import 'dart:io';
import 'package:minprom_of_omsk_signal/container/container_extender.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/constant_container.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_action.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_extractable.dart';
import 'package:path_provider/path_provider.dart';

Future<void> saveData(Map<String, dynamic> curentValue) async {
  Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  ContainerExtender.extend(valueContainer, 'dataDir', appDocumentsDir);
  final File file = File('${appDocumentsDir.path}/data.json');
  if (await file.exists()) {
    Map<String, dynamic> x = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
    (x['data'] as List).add(curentValue);
    file.writeAsString(jsonEncode(x));
  } else {
    file.writeAsString(jsonEncode({'data': [curentValue]}));
  }
}

class SaveHistoryData extends IAction{
  @override
  void action(IExtractable? arg) async {
    String historyFileName = ContainerExtractor.extract<String>(constantContainer, 'historyFileName');
    String path = '${ContainerExtractor.extract<Directory>(valueContainer, 'appDataHistoryDir').path}/$historyFileName';
    File file = File(path);
    var x = ContainerExtractor.extract<Map<String, dynamic>>(valueContainer, 'historyData');
    file.writeAsString(jsonEncode(x));
  }
}
