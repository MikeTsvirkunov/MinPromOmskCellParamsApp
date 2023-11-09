import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/app/functions/on_start_initiation.dart';
import 'package:minprom_of_omsk_signal/app_widget.dart';
import 'package:minprom_of_omsk_signal/checkers/require_premission.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/constant_container.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_action.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_extendable.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_extractable.dart';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  late Future<bool> locationPremission;
  late Future<void> initiation;
  @override
  void initState() {
    super.initState();
    initiation = onStartInitiation();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 236, 236, 236),
          body: FutureBuilder(
            future: initiation, 
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(child: Center(child: Text('Please wait its loading...')));
              } else {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const MyApp();
                }
              }
            }
          )
        )
      )
    );
  }
}
