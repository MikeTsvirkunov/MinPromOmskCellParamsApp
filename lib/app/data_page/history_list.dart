import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/container/container_extender.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/sorting_filters_container.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';
import 'package:minprom_of_omsk_signal/processors/builders/build_list_from_data.dart';
import 'package:minprom_of_omsk_signal/processors/load_saved_data.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({Key? key}) : super(key: key);

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  late Future<Map<String, dynamic>> data;
  @override
  void initState() {
    super.initState();
    data = loadDataFromLocal();
    ContainerExtender.extend(valueContainer, 'HistList.Updater', () => setState((){}));
  }

  @override
  Widget build(BuildContext context) {
    
    ContainerExtender.extend(
        valueContainer, 'HistList.Updater', () => setState(() {}));
    var filter = ContainerExtractor.extract(sortingFilterContainer, ContainerExtractor.extract(
            valueContainer, 'HistoryData.CurrentFilter'));
    List<Widget> m = buildListFromData(
        ContainerExtractor.extract<Map<String, dynamic>>(
            valueContainer, 'historyData')['data']!);
    m.sort(filter);
    return FutureBuilder(
        future: data,
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Please wait its loading...');
          } else {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView(
                children: m,
              );
            }
          }
        }
    );
  }
}
