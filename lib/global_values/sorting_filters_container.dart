import 'package:minprom_of_omsk_signal/app/data_page/history_data_block.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/container/default_container.dart';

DefaultContainer sortingFilterContainer = DefaultContainer({
  'HistoryBlock.Filter.ByDate': (HistoryDataBlock a, HistoryDataBlock b) => ContainerExtractor.extract(a.params, "ParamsValueMap")["currentDateTime"] - ContainerExtractor.extract(b.params, "ParamsValueMap")["currentDateTime"] as int,
  'HistoryBlock.Filter.ByCellId': (HistoryDataBlock a, HistoryDataBlock b) => ContainerExtractor.extract(
          a.params, "ParamsValueMap")["currentCellId"] -
      ContainerExtractor.extract(b.params, "ParamsValueMap")["currentCellId"] as int, 
  'HistoryBlock.Filter.ByPower': (HistoryDataBlock a, HistoryDataBlock b) => ContainerExtractor.extract(
          a.params, "ParamsValueMap")["cellSignalStrength"] -
      ContainerExtractor.extract(b.params, "ParamsValueMap")["cellSignalStrength"] as int, 
  'HistoryBlock.Filters.List': [
    'HistoryBlock.Filter.ByDate',
    'HistoryBlock.Filter.ByPower',
    'HistoryBlock.Filter.ByCellId'
  ],
  'FilterNameToText': {
    'HistoryBlock.Filter.ByDate': 'Дате добавления',
    'HistoryBlock.Filter.ByPower': 'Мощности сигнала',
    'HistoryBlock.Filter.ByCellId': 'ID вышки',
  }
});
