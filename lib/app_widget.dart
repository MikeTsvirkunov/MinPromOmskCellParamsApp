import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/app/coords_display/coords_display.dart';
import 'package:minprom_of_omsk_signal/app/data_page/data_page.dart';
import 'package:minprom_of_omsk_signal/app/map_page.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack, overlays: SystemUiOverlay.values);
//     return const Scaffold(
//       body: TabBarView(
//         // controller: TabController(length: 2, vsync: TooltipState()),
//         children: [
//           DataPage(),
//           MapDisplay(),
//           // SignalStrenthDisplay(),
//         ],
//       ),
//     );
//   }
// }


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: [
        DataPage(),
        MapDisplay(controller: controller,),
      ]
    );
  }
}