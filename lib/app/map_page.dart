import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';

class MapDisplay extends StatefulWidget {
  final TabController controller;
  const MapDisplay({Key? key, required this.controller}) : super(key: key);

  @override
  State<MapDisplay> createState() => _MapDisplayState();
}
// вставка удаление пораждают две табоицы
class _MapDisplayState extends State<MapDisplay> {
  late List histData;
  @override
  void initState() {
    histData = ContainerExtractor.extract<Map>(valueContainer, 'historyData')['data'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(onPressed: (){widget.controller.animateTo(0);}, child: Icon(Icons.arrow_back), shape: CircleBorder(), backgroundColor: Color(0xffffffff),),
      body: FlutterMap(
      options: MapOptions(
        interactionOptions: const InteractionOptions(
          debugMultiFingerGestureWinner: true,
          enableMultiFingerGestureRace: true,
          pinchMoveThreshold: 10.0,
          pinchMoveWinGestures: MultiFingerGesture.pinchZoom,
          rotationThreshold: 10,
          rotationWinGestures: 10
        ),
        minZoom: 8,
        cameraConstraint: CameraConstraint.containCenter(bounds: LatLngBounds(
          LatLng(
            ContainerExtractor.extract(valueContainer, 'currentLatitude')+1,
            ContainerExtractor.extract(valueContainer, 'currentLongitude')+1
          ),
          LatLng(
            ContainerExtractor.extract(valueContainer, 'currentLatitude')-1,
            ContainerExtractor.extract(valueContainer, 'currentLongitude')-1
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
        MarkerLayer(
              markers: List.generate(histData.length, (index) => Marker(point: LatLng(histData[index]['currentLatitude'], histData[index]['currentLongitude']), child: Icon(Icons.place)))
            ),
      ],
    ),
    // bottomNavigationBar: SlidingUpPanel(
    //     panel: Center(
    //       child: Text("This is the sliding Widget"),
    //     ),
    //   ),
    );
  }
}

