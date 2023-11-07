import 'dart:convert';
import 'dart:io';
import 'package:minprom_of_omsk_signal/container/container_extender.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';
import 'package:path_provider/path_provider.dart';

Future<Map<String, dynamic>> loadDataFromLocal() async {
  Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  ContainerExtender.extend(valueContainer, 'dataDir', appDocumentsDir);
  final File file = File('${appDocumentsDir.path}/data.json');
  if (await file.exists()) {
    return jsonDecode(await file.readAsString());
  } else {
    file.writeAsString('{"data": []}');
    return {'data': []};
  }
}
