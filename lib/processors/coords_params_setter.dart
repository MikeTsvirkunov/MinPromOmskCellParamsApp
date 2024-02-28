import 'package:geolocator/geolocator.dart';
import 'package:minprom_of_omsk_signal/container/container_extender.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_action.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_extractable.dart';

class SetCoordsParamsInGlobal extends IAction {
  @override
  void action(IExtractable? arg) async {
    print(LocationAccuracy.low);
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // Position? position1 = await Geolocator.getLastKnownPosition();
    LocationPermission permission = await Geolocator.checkPermission();
    var accuracy = await Geolocator.getLocationAccuracy();
    Position? position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print('a');
    ContainerExtender.extend(valueContainer, 'currentLatitude', position.latitude);
    ContainerExtender.extend(valueContainer, 'currentLongitude', position.longitude);
  }
}
