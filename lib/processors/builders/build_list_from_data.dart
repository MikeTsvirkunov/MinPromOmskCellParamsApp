import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/app/data_page/history_data_block.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/container/default_container.dart';
import 'package:minprom_of_omsk_signal/global_values/sorting_filters_container.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';

List<Widget> buildListFromData(List data){
  var l = List.generate(
    data.length, 
    (index){
      Map<String, dynamic> params = {'ParamsValueMap': {}}; 
      data[index].keys.forEach(
        (element) {
          if (data[index][element] != null) params['ParamsValueMap']![element] = data[index][element];
        }
      );
      var p = DefaultContainer(
        params
      );
      var hdb = HistoryDataBlock(
        cellStrenth: data[index]['cellSignalStrength'], notation: 'dBm', 
        params: p,
      );
      return hdb;
    }
  );
  int Function(HistoryDataBlock, HistoryDataBlock) filter = ContainerExtractor.extract(sortingFilterContainer,
      ContainerExtractor.extract(valueContainer, 'HistoryData.CurrentFilter'));
  l.sort(filter);
  return l;
}