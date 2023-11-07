import 'package:permission_handler/permission_handler.dart';

Future<bool> askLocationPermission() async {
  PermissionStatus status = await Permission.location.request();
  if (status.isDenied == true) {
    return askLocationPermission();
  } else {
    return true;
  }
}
