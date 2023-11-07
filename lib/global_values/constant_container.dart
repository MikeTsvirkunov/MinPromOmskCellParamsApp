import 'package:minprom_of_omsk_signal/container/constant_container.dart';
import 'package:minprom_of_omsk_signal/generators/generate_extra_options_for_current_data_block.dart';
import 'package:minprom_of_omsk_signal/processors/cell_params_setter.dart';
import 'package:minprom_of_omsk_signal/processors/coords_params_setter.dart';
import 'package:minprom_of_omsk_signal/processors/neitral_params_processor.dart';
import 'package:signal_strength/signal_strength.dart';

ConstantContainer constantContainer = ConstantContainer(
  {
    'ExtraOptionsKeyProcessorMap': {
      'Район': NeitralParamProcessor(),
      'Оператор связи': NeitralParamProcessor(),
      'Критерий 3': NeitralParamProcessor(),
      'ID вышки': NeitralParamProcessor()
    },
    'SignalParamsExtractor': SignalStrength(),
    'SetCellParamsInGlobal': SetCellParamsInGlobal(),
    'SetCoordsParamsInGlobal': SetCoordsParamsInGlobal(),
    'GenerateExtraOptionsForCurrentDataBlock': GenerateExtraOptionsForCurrentDataBlock()
  }
);