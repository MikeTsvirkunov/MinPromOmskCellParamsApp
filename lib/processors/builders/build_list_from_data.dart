import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/app/data_page/history_data_block.dart';

List<Widget> buildListFromData(List data){
  return List.generate(data.length, (index) => HistoryDataBlock(
      cellStrenth: data[index]['cellSignalStrength'] ?? 1, 
      notation: 'dBm', street: 'Street 1'
    )
  );
}