import 'package:minprom_of_omsk_signal/interfaces/interface_extractable.dart';

abstract class IStrategy{
  T execute<T>(IExtractable? arg);
}
