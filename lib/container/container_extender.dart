import 'package:minprom_of_omsk_signal/interfaces/interface_extendable.dart';

/// Class values for extend container
class ContainerExtender{
  /// set object [value] to extendable [container] on [key]
  static void extend(IExtandable container, Object key, dynamic value) {
    container.extend(key, value);
  }
}