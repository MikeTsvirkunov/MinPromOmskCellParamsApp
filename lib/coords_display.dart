import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
// import 'package:telephony/telephony.dart';


class PositionDisplay extends StatefulWidget {
  const PositionDisplay({Key? key}) : super(key: key);

  @override
  State<PositionDisplay> createState() => _PositionDisplayState();
}

class _PositionDisplayState extends State<PositionDisplay> {
  double x = 1;
  double y = 1;
  late Timer _timer;
  late List<int>? getCellularSignalStrength;
  int k = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 1), _getNetworkStats);
  }

  void _getNetworkStats() async {
    _timer.cancel();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    k += 1;
    x = position.latitude;
    y = position.longitude;
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
          Text('x: $x'),
          Text('y: $y'),
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
