import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/app/data_page/extra_options_fragment.dart';
import 'package:minprom_of_omsk_signal/app/data_page/history_data_block.dart';
import 'package:minprom_of_omsk_signal/app/data_page/signal_strenth_fragment.dart';
import 'package:minprom_of_omsk_signal/container/default_container.dart';
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
    // TODO: implement initState
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
              children: buildListFromData(snapshot.data!['data']!),
            );
          }
        }
      }
    );
    // return ListView(
    //   children: const [
    //   ],
    // );
  }
}
