import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/constant_container.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_extractable.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_strategy.dart';

class AnotherOptionsFragment extends StatefulWidget {
  final IExtractable params;
  const AnotherOptionsFragment(
      {Key? key, required this.params,})
      : super(key: key);

  @override
  State<AnotherOptionsFragment> createState() => _AnotherOptionsFragmentState();
}

class _AnotherOptionsFragmentState extends State<AnotherOptionsFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: ContainerExtractor.extract<IStrategy>(
          constantContainer, 
          'GenerateExtraOptionsForCurrentDataBlock'
        ).execute(
          widget.params
        ),
      )
    );
  }
}
