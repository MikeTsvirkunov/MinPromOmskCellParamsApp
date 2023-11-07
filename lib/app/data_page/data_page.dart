import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/app/data_page/current_data_block.dart';
import 'package:minprom_of_omsk_signal/app/data_page/history_list.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';
import 'package:minprom_of_omsk_signal/processors/save_data.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
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
            child: Flex(
              direction: Axis.vertical,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    const Text('Мои замеры'),
                    const Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(Icons.import_export_outlined))
                  ],
                ),
                const Flexible(
                  fit: FlexFit.tight, 
                  child: SizedBox(
                    child: HistoryList()
                  )
                )
              ]
            ),
          )
        ),
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          ),
          child: TextButton(
            onPressed: () {
              saveData({'cellStrenth': ContainerExtractor.extract(valueContainer, 'cellSignalStrength')});
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black)),
            child: const Text(
              'Зафиксировать',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        )
      ],
    );
  }
}
