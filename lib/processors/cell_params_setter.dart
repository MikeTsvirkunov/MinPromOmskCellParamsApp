import 'package:minprom_of_omsk_signal/container/container_extender.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/constant_container.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_action.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_extractable.dart';
import 'package:signal_strength/signal_strength.dart';

class SetCellParamsInGlobal extends IAction {
  @override
  void action(IExtractable? arg) async {
    SignalStrength x = ContainerExtractor.extract<SignalStrength>(constantContainer, 'SignalParamsExtractor');
    var iowf = await x.isOnWifi();
    var ioc = await x.isOnCellular();
    var gcss = await x.getCellularSignalStrength();
    var gwfss = await x.getWifiSignalStrength();
    ContainerExtender.extend(valueContainer, 'isWiFiAvailable',  iowf);
    ContainerExtender.extend(valueContainer, 'isCellAvailable;', ioc);
    ContainerExtender.extend(valueContainer, 'cellSignalStrength', gcss ?? 'Waiting');
    ContainerExtender.extend(valueContainer, 'wifiSignalStrength', gwfss ?? 'Waiting');
  }
}
