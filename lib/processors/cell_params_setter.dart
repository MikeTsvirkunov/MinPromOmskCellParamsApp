import 'package:flutter/services.dart';
import 'package:minprom_of_omsk_signal/container/container_extender.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/constant_container.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_action.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_extractable.dart';
import 'package:signal_strength/signal_strength.dart';
// import 'package:telephony/telephony.dart';

class SetCellParamsInGlobal extends IAction {
  static const platform = MethodChannel('get_cell_data');
  @override
  void action(IExtractable? arg) async {
    SignalStrength x = ContainerExtractor.extract<SignalStrength>(constantContainer, 'SignalParamsExtractor');
    var iowf = await x.isOnWifi();
    var ioc = await x.isOnCellular();
    var gcss = await x.getCellularSignalStrength();
    var gwfss = await x.getWifiSignalStrength();
    var gsmCellTowerId = await platform.invokeMethod('getGSMCellTowerId');
    var gsmCellStrength =await platform.invokeMethod('getLTESignalStrength');
    var cdmaCellStrength = await platform.invokeMethod('getCDMACellSignalStrength');
    var gsmCellSignalStrength = await platform.invokeMethod('getGsmCellSignalStrength');
    var signalStrengthLevel = await platform.invokeMethod('getSignalStrengthLevel');
    var signalStrengthLevel2 = await platform.invokeMethod('getSignalStrengthLevel2');
    ContainerExtender.extend(valueContainer, 'isWiFiAvailable',  iowf);
    ContainerExtender.extend(valueContainer, 'isCellAvailable;', ioc);
    ContainerExtender.extend(valueContainer, 'cellSignalStrength', signalStrengthLevel2 ?? 'Waiting');
    ContainerExtender.extend(valueContainer, 'wifiSignalStrength', gwfss ?? 'Waiting');
    ContainerExtender.extend(valueContainer, 'gsmCellTowerId', gsmCellTowerId ?? 'Waiting');
  }
}
