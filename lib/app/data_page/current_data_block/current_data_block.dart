import 'dart:async';

import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/app/data_page/extra_options_fragment.dart';
import 'package:minprom_of_omsk_signal/app/data_page/signal_strenth_fragment.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/container/default_container.dart';
import 'package:minprom_of_omsk_signal/global_values/constant_container.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_action.dart';

class CurrentDataBlock extends StatefulWidget {
  const CurrentDataBlock({Key? key}) : super(key: key);

  @override
  State<CurrentDataBlock> createState() => _CurrentDataBlockState();
}

class _CurrentDataBlockState extends State<CurrentDataBlock> {

  late Timer _timer;
  int k = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 1), _getNetworkStats);
  }

  void _getNetworkStats() async {
    _timer.cancel();
    k += 1;
    ContainerExtractor.extract<IAction>(constantContainer, 'UpdateCurrentDataBlock').action(DefaultContainer({'params': [null, null]}));
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
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          SignalStrenthFragment(cellStrenth: ContainerExtractor.extract(valueContainer, 'cellSignalStrength') ?? "Waiting", notation: 'dBm',),
          AnotherOptionsFragment(
            params: DefaultContainer(
              {
                'ParamsValueMap': {
                  'street': 'ул. Пушкина, д. Калатушкина', 
                  'longitude': ContainerExtractor.extract(valueContainer, 'currentLongitude') ?? "Waiting",
                  'latitude': ContainerExtractor.extract(valueContainer, 'currentLatitude') ?? "Waiting",
                  'cellID': ContainerExtractor.extract(valueContainer, 'gsmCellTowerId') ?? "Waiting"
                }
              }
            )
          )
        ]
      ),
    );
  }
}
