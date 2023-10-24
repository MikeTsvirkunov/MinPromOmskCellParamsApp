import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/constant_container.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_action.dart';
import 'dart:async';
// import 'package:telephony/telephony.dart';

class SignalStrenthDisplay extends StatefulWidget {
  const SignalStrenthDisplay({Key? key}) : super(key: key);

  @override
  State<SignalStrenthDisplay> createState() => _SignalStrenthDisplayState();
}

class _SignalStrenthDisplayState extends State<SignalStrenthDisplay> {
  late Timer _timer;
  dynamic isOnCellular=true;
  dynamic isOnWifi=true;
  dynamic getWifiSignalStrength=1;
  dynamic getCellularSignalStrength=[];
  int k = 0;


  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 1), _getNetworkStats);
  }

  void _getNetworkStats() async {
    _timer.cancel();
    k+=1;
    ContainerExtractor.extract<IAction>(constantContainer, 'SetCellParamsInGlobal').action(null);
    isOnCellular = ContainerExtractor.extract(valueContainer, 'isCellAvailable');
    isOnWifi = ContainerExtractor.extract(valueContainer, 'isWiFiAvailable');
    getWifiSignalStrength = ContainerExtractor.extract(valueContainer, 'wifiSignalStrength');
    getCellularSignalStrength = ContainerExtractor.extract(valueContainer, 'cellSignalStrength');
    setState(() {});
    _timer = Timer(const Duration(seconds: 1), _getNetworkStats);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Cell strength: $getCellularSignalStrength'),
          Text('Wifi strength: $getWifiSignalStrength'),
          Text('On cellular: $isOnCellular'),
          Text('On wifi: $isOnWifi'),
          Text('f = $k')
        ],
      ),
    );
  }

}

class NetworkStats {
  NetworkStats(this.hasCellular, this.hasWifi, this.wifiSignalStrength,
      this.cellularSignalStrength);
  bool hasCellular;
  bool hasWifi;
  int? wifiSignalStrength;
  List<int>? cellularSignalStrength;
}

