import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/app_widget.dart';
import 'package:minprom_of_omsk_signal/checkers/require_premission.dart';

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
  @override
  void initState() {
    super.initState();
    locationPremission = askLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 236, 236, 236),
          body: FutureBuilder(
            future: locationPremission, 
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Please wait its loading...');
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
