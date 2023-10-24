import 'package:minprom_of_omsk_signal/interfaces/interface_cell_params_conteiner.dart';

class CellParamsContainer extends ICellParamsContainer{
  CellParamsContainer(
    this.hasCellular, 
    this.hasWifi, 
    this.wifiSignalStrength,
    this.cellularSignalStrength);
  bool hasCellular;
  bool hasWifi;
  int? wifiSignalStrength;
  List<int>? cellularSignalStrength;

  @override
  double getCellStrenth() {
    return (cellularSignalStrength ?? [1])[0] as double;
  }
  @override
  double getWIFIStrenth() {
    return (wifiSignalStrength ?? -1) as double;
  }

  @override
  bool checkIsCelliAvailable() {
    return hasCellular;
  }

  @override
  bool checkIsWiFiAvailable() {
    return hasWifi;
  }
}
