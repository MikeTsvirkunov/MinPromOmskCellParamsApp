import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/app/data_page/data_page.dart';
import 'package:minprom_of_omsk_signal/app/map_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack, overlays: SystemUiOverlay.values);
    return const TabBarView(
      children: [
        DataPage(),
        MapDisplay()
        // SignalStrenthDisplay(),
      ],
    );
  }
}
