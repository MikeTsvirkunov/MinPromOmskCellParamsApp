import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/constant_container.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';
import 'dart:async';

import 'package:minprom_of_omsk_signal/interfaces/interface_action.dart';
// import 'package:telephony/telephony.dart';


class PositionDisplay extends StatefulWidget {
  const PositionDisplay({Key? key}) : super(key: key);

  @override
  State<PositionDisplay> createState() => _PositionDisplayState();
}

class _PositionDisplayState extends State<PositionDisplay> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 1), _getNetworkStats);
  }

  void _getNetworkStats() async {
    _timer.cancel();
    ContainerExtractor.extract<IAction>(constantContainer, 'SetCoordsParamsInGlobal').action(null);
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
          Text('x: ${ContainerExtractor.extract(valueContainer, 'currentLatitude') ?? 'Waiting'}'),
          Text('y: ${ContainerExtractor.extract(valueContainer, 'currentLongitude') ?? 'Waiting'}'),
        ],
      ),
    );
  }
}
