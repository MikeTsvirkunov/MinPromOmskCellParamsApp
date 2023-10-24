import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/coords_display.dart';
import 'package:minprom_of_omsk_signal/signal_strenth_display/signal_strenth_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Column(children: [SignalStrenthDisplay(), PositionDisplay()])
      )
    );
  }
}
