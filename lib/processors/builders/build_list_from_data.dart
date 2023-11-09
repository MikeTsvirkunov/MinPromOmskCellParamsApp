import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/app/data_page/history_data_block.dart';
import 'package:minprom_of_omsk_signal/container/default_container.dart';

List<Widget> buildListFromData(List data){
  return List.generate(
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
      return HistoryDataBlock(
        cellStrenth: data[index]['cellSignalStrength'], notation: 'dBm', 
        params: p,
      );
    }
  );
}