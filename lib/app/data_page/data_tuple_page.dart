import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/app/cell_meter_page.dart/cell_meter_page.dart';
import 'package:minprom_of_omsk_signal/app/data_page/current_data_block/current_data_block.dart';
import 'package:minprom_of_omsk_signal/app/data_page/pop_up_metering_widget.dart';
import 'package:minprom_of_omsk_signal/app/data_page/popup_sorting_widget/pop_up_sorting_widget.dart';
import 'package:minprom_of_omsk_signal/container/container_extender.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/constant_container.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_action.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_strategy.dart';
import 'package:minprom_of_omsk_signal/processors/builders/build_list_from_data.dart';

class DataTuplePage extends StatefulWidget {
  const DataTuplePage({Key? key}) : super(key: key);

  @override
  State<DataTuplePage> createState() => _DataTuplePageState();
}

class _DataTuplePageState extends State<DataTuplePage> {
  @override
  Widget build(BuildContext context) {
    
    ContainerExtender.extend(valueContainer, 'HistList.Updater', () => setState(() {}));
    return Flex(
      direction: Axis.vertical,
      children: [
        const CurrentDataBlock(),
        Flexible(
            fit: FlexFit.tight,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Flex(direction: Axis.vertical, children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    const Text('Мои замеры'),
                    const Spacer(),
                    IconButton(
                        onPressed: () async {
                          await showDialog(
                              context: context,
                              builder: (context) => PopUpSortingWidget());
                        },
                        icon: const Icon(Icons.import_export_outlined))
                  ],
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: SizedBox(
                        child: ListView(
                      children: buildListFromData(
                          ContainerExtractor.extract<Map<String, dynamic>>(
                              valueContainer, 'historyData')['data']!),
                    )))
              ]),
            )),
        Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: TextButton(
              onPressed: () async {
                var currentParams = ContainerExtractor.extract<IStrategy>(
                        constantContainer, 'CurrentParamsMapBuilder')
                    .execute(null);
                var historyData =
                    ContainerExtractor.extract<Map<String, dynamic>>(
                        valueContainer, 'historyData');
                historyData['data'].add(currentParams);
                ContainerExtender.extend(
                    valueContainer, 'historyData', historyData);
                ContainerExtractor.extract<IAction>(
                        constantContainer, 'SaveHistoryData')
                    .action(null);
                setState(() {});
                await showDialog(
                    context: context,
                    builder: (context) => PopUpMeteringWidget());
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const CellMeterPage()),
                // );
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black)),
              child: const Text(
                'Зафиксировать',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ))
      ],
    );
  }
}
