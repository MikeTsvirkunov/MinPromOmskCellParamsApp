import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/app/coords_display/coords_display.dart';
import 'package:minprom_of_omsk_signal/app/data_page/data_page.dart';
import 'package:minprom_of_omsk_signal/app/map_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack, overlays: SystemUiOverlay.values);
    return const Scaffold(
      body: TabBarView(
        children: [
          DataPage(),
          MapDisplay(),
          // SignalStrenthDisplay(),
        ],
      ),
      // bottomNavigationBar: TabBar(
      //   labelStyle: TextStyle(
      //     color: Colors.black,
      //   ),
      //   indicatorColor: Color(0x00000000),
      //   labelColor: Color(0xFF0094ff),
      //   dividerColor: Color(0xFFD1D1D1),
      //   unselectedLabelColor: Color(0xffd1d1d1),
      //   tabs: [
      //     Tab(
      //       icon: Icon(Icons.map_outlined),
      //       text: 'Карта',
      //     ),
      //     Tab(
      //       icon: Icon(Icons.home_outlined),
      //     )
      //   ]
      // ),
    );
  }
}
