import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';
import 'package:minprom_of_omsk_signal/processors/builders/build_list_from_data.dart';
import 'package:minprom_of_omsk_signal/processors/load_saved_data.dart';
import 'package:minprom_of_omsk_signal/processors/set_history_data.dart';

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
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data, 
      builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Please wait its loading...');
        } else {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView(
              children: buildListFromData(ContainerExtractor.extract<Map<String, dynamic>>(valueContainer, 'historyData')['data']!),
            );
          }
        }
      }
    );
  }
}
