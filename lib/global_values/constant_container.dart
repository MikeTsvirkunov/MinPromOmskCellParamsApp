import 'package:minprom_of_omsk_signal/container/constant_container.dart';
import 'package:minprom_of_omsk_signal/container/default_container.dart';
import 'package:minprom_of_omsk_signal/processors/app_dir_setter.dart';
import 'package:minprom_of_omsk_signal/processors/builders/build_map_of_current_params.dart';
import 'package:minprom_of_omsk_signal/processors/generators/generate_extra_options_for_current_data_block.dart';
import 'package:minprom_of_omsk_signal/processors/cell_params_setter.dart';
import 'package:minprom_of_omsk_signal/processors/coords_params_setter.dart';
import 'package:minprom_of_omsk_signal/processors/macro_action.dart';
import 'package:minprom_of_omsk_signal/processors/neitral_params_processor.dart';
import 'package:minprom_of_omsk_signal/processors/program_param_to_text_processor.dart';
import 'package:minprom_of_omsk_signal/processors/save_data.dart';
import 'package:minprom_of_omsk_signal/processors/set_history_data.dart';
import 'package:minprom_of_omsk_signal/processors/set_loaded_data.dart';
import 'package:minprom_of_omsk_signal/processors/time_processor.dart';
import 'package:signal_strength/signal_strength.dart';

ConstantContainer constantContainer = ConstantContainer(
  {
    'ExtraOptionsKeyProcessorMap': {
      'street': ProgramParamToTextProcessor(),
      'mobileOperator': ProgramParamToTextProcessor(),
      'cellID': ProgramParamToTextProcessor(),
      'longitude': ProgramParamToTextProcessor(),
      'latitude': ProgramParamToTextProcessor(),
      'time': ProgramParamToTextProcessor(),
      'date': ProgramParamToTextProcessor(),
      'cellSignalStrength': ProgramParamToTextProcessor(),
      'currentDateTime': ProgramParamToTextProcessor(),
      'currentCellId': ProgramParamToTextProcessor(),
      'currentLatitude': ProgramParamToTextProcessor(),
      'currentLongitude': ProgramParamToTextProcessor(),
    },
    'ExtraOptionsValueProcessorMap': {
      'street': NeitralParamProcessor(),
      'mobileOperator': NeitralParamProcessor(),
      'cellID': NeitralParamProcessor(),
      'longitude': NeitralParamProcessor(),
      'latitude': NeitralParamProcessor(),
      'time': NeitralParamProcessor(),
      'date': NeitralParamProcessor(),
      'cellSignalStrength': NeitralParamProcessor(),
      'currentDateTime': TimeProcessor(),
      'currentCellId': NeitralParamProcessor(),
      'currentLatitude': NeitralParamProcessor(),
      'currentLongitude': NeitralParamProcessor(),
    },
    'SignalParamsExtractor': SignalStrength(),
    'SetCellParamsInGlobal': SetCellParamsInGlobal(),
    'SetCoordsParamsInGlobal': SetCoordsParamsInGlobal(),
    'GenerateExtraOptionsForCurrentDataBlock': GenerateExtraOptionsForCurrentDataBlock(),
    'OnStartInitiateAction': MacroAction(
      [
        SetAppDir(),
        SetCellParamsInGlobal(),
        SetCoordsParamsInGlobal(),
        SetHistoryData(),
      ]
    ),
    'OnStartInitiateActionParams': DefaultContainer({'params': [null, null, null, null]}),
    'UpdateCurrentDataBlock': MacroAction(
      [
        SetCellParamsInGlobal(),
        SetCoordsParamsInGlobal()
      ]
    ),
    'CurrentParamsMapBuilder': CurrentParamsMapBuilder(),
    'SetLoadedData': SetLoadedData(),
    'SetHistoryData': SetHistoryData(),
    'historyFileName': 'data.json',
    'SaveHistoryData': SaveHistoryData()
  }
);

