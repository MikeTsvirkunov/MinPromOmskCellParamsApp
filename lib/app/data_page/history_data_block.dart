import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/app/data_page/extra_options_fragment.dart';
import 'package:minprom_of_omsk_signal/app/data_page/signal_strenth_fragment.dart';
import 'package:minprom_of_omsk_signal/container/default_container.dart';

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
    return Container(
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
    );
  }
}
