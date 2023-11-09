import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';

class MapDisplay extends StatefulWidget {
  const MapDisplay({Key? key}) : super(key: key);

  @override
  State<MapDisplay> createState() => _MapDisplayState();
}
class _MapDisplayState extends State<MapDisplay> {  
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        minZoom: 8,
        cameraConstraint: CameraConstraint.containCenter(bounds: LatLngBounds(
          LatLng(
            ContainerExtractor.extract(valueContainer, 'currentLatitude')+5, 
            ContainerExtractor.extract(valueContainer, 'currentLongitude')+5
          ),
          LatLng(
            ContainerExtractor.extract(valueContainer, 'currentLatitude')-5,
            ContainerExtractor.extract(valueContainer, 'currentLongitude')-5
          ),
        )),
        initialCenter: LatLng(
          ContainerExtractor.extract(valueContainer, 'currentLatitude'), 
          ContainerExtractor.extract(valueContainer, 'currentLongitude')
        ),
        initialZoom: 9.2,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        
        Container(
          color: Colors.amber,
          height: 100,
        ),
        // RichAttributionWidget(
        //   attributions: [
        //     TextSourceAttribution(
        //       'OpenStreetMap contributors',
        //       onTap: () =>
        //           launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
