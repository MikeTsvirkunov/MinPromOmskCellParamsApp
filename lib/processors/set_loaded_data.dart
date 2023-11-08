import 'dart:convert';
import 'dart:io';
import 'package:minprom_of_omsk_signal/container/container_extender.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_action.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_extractable.dart';
import 'package:path_provider/path_provider.dart';

Future<Map<String, dynamic>> loadDataFromLocal() async {
  Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  ContainerExtender.extend(valueContainer, 'appDataHistoryDir', appDocumentsDir);
  final File file = File('${appDocumentsDir.path}/data.json');
  if (await file.exists()) {
    return jsonDecode(await file.readAsString());
  } else {
    file.writeAsString('{"data": []}');
    return {'data': []};
  }
}

/// Load data from ```path``` and set it in memory in memory by ```key```
class SetLoadedData extends IAction {
  @override
  void action(IExtractable? arg) async {
    var path = ContainerExtractor.extract<String>(arg!, 'path');
    var key = ContainerExtractor.extract<String>(arg, 'key');
    final File file = File(path);
    if (await file.exists()) {
      ContainerExtender.extend(
          valueContainer, key, jsonDecode(await file.readAsString()));
    } else {
      ContainerExtender.extend(valueContainer, key, {'data': []});
    }
  }
}
