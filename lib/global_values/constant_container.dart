import 'package:minprom_of_omsk_signal/container/constant_container.dart';
import 'package:minprom_of_omsk_signal/processors/cell_params_setter.dart';
import 'package:minprom_of_omsk_signal/processors/coords_params_setter.dart';
import 'package:signal_strength/signal_strength.dart';

ConstantContainer constantContainer = ConstantContainer(
  {
    'SignalParamsExtractor': SignalStrength(),
    'SetCellParamsInGlobal': SetCellParamsInGlobal(),
    'SetCoordsParamsInGlobal': SetCoordsParamsInGlobal()
  }
);