import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/container/container_extender.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/sorting_filters_container.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';

class SortingRow extends StatefulWidget {
  final String value;
  final Function uppdate;
  const SortingRow({super.key, required this.value, required this.uppdate});

  @override
  State<SortingRow> createState() => _SortingRowState();
}

class _SortingRowState extends State<SortingRow> {
  @override
  Widget build(BuildContext context) {
    var t = ContainerExtractor.extract<Map<String, String>>(sortingFilterContainer, 'FilterNameToText');
    var gv = ContainerExtractor.extract(valueContainer, 'HistoryData.CurrentFilter');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(t[widget.value]!),
        Radio(
            value: widget.value,
            groupValue: gv,
            onChanged: (obj) {
              ContainerExtender.extend(valueContainer, 'HistoryData.CurrentFilter', widget.value);
              widget.uppdate();
            })
      ],
    );
  }
}