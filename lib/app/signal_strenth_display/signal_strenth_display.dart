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
    setState(() {});
    _timer = Timer(const Duration(seconds: 1), _getNetworkStats);
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Cell strength: ${ContainerExtractor.extract(valueContainer, 'isCellAvailable')}'),
          Text('Wifi strength: ${ContainerExtractor.extract(valueContainer, 'isWiFiAvailable')}'),
          Text('On cellular: ${ContainerExtractor.extract(valueContainer, 'cellSignalStrength')}'),
          Text('On wifi: ${ContainerExtractor.extract(valueContainer, 'wifiSignalStrength')}'),
          Text('On wifi: ${ContainerExtractor.extract(valueContainer, 'gsmCellTowerId')}'),
          Text('f = $k')
        ],
      ),
    );
  }

}
