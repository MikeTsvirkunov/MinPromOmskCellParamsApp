import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/app/cell_meter_page.dart/cell_meter_page.dart';
import 'package:minprom_of_omsk_signal/app/data_page/current_data_block/current_data_block.dart';
import 'package:minprom_of_omsk_signal/app/data_page/data_tuple_page.dart';
import 'package:minprom_of_omsk_signal/container/container_extender.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/constant_container.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_action.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_strategy.dart';
import 'package:minprom_of_omsk_signal/processors/builders/build_list_from_data.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DataTuplePage(),
        // Container(width: 40, height: 40, color: Colors.amber, child: Text('asdfghj'),)
      ],
    );
  }
}
