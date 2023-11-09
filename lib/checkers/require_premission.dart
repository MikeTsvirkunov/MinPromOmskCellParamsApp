import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/constant_container.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_action.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_extractable.dart';
import 'package:minprom_of_omsk_signal/processors/load_saved_data.dart';
import 'package:minprom_of_omsk_signal/processors/set_history_data.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> askLocationPermission() async {
  PermissionStatus status = await Permission.location.request();
  if (status.isDenied == true) {
    return askLocationPermission();
  } else {
    await loadDataFromLocal();
    SetHistoryData().action(null);
    // var params = ContainerExtractor.extract<IExtractable>(constantContainer, 'OnStartInitiateActionParams');
    // ContainerExtractor.extract<IAction>(constantContainer, 'OnStartInitiateAction').action(params);
    return true;
  }
}
