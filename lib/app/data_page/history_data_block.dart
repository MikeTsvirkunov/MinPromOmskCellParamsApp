import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/app/data_page/extra_options_fragment.dart';
import 'package:minprom_of_omsk_signal/app/data_page/signal_strenth_fragment.dart';
import 'package:minprom_of_omsk_signal/container/container_extender.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/container/default_container.dart';
import 'package:minprom_of_omsk_signal/global_values/constant_container.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_action.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_strategy.dart';

class HistoryDataBlock extends StatefulWidget {
  final Object cellStrenth;
  final Object notation;
  final DefaultContainer params;
  
  const HistoryDataBlock({Key? key, required this.cellStrenth, required this.notation, required this.params}) : super(key: key);

  @override
  State<HistoryDataBlock> createState() => _HistoryDataBlockState();
}

class _HistoryDataBlockState extends State<HistoryDataBlock> {
  @override
  Widget build(BuildContext context) {
    var d = ContainerExtractor.extract(widget.params, 'ParamsValueMap');
    
    return Dismissible(
      key: Key('data_hist_block_${ContainerExtractor.extract(widget.params, 'ParamsValueMap')['currentDateTime']}'), 
      onDismissed: (DismissDirection direction) {
        // var currentParams = ContainerExtractor.extract<IStrategy>(constantContainer, 'CurrentParamsMapBuilder').execute(null);
        var historyData = ContainerExtractor.extract<Map<String, dynamic>>(valueContainer, 'historyData');
        // historyData['data'].add(currentParams);
        // historyData.update(key, (value) => null)
        (historyData['data'] as List).removeWhere((element) => element['currentDateTime'] == ContainerExtractor.extract(widget.params, 'ParamsValueMap')['currentDateTime']);
        ContainerExtender.extend(valueContainer, 'historyData', historyData);
        ContainerExtractor.extract<IAction>(constantContainer, 'SaveHistoryData').action(null);
      },
    child: Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 246, 246, 246),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          SignalStrenthFragment(
            cellStrenth: widget.cellStrenth,
            notation: widget.notation,
            meterTextSize: 14,
          ),
          AnotherOptionsFragment(
            params: widget.params
          )
        ]
      ),
    )
    );
  }
}
