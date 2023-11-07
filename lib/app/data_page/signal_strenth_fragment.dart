import 'package:flutter/material.dart';
import 'package:signal_strength_indicator/signal_strength_indicator.dart';

class SignalStrenthFragment extends StatefulWidget {
  final Object cellStrenth;
  final Object notation;
  final double meterTextSize;
  const SignalStrenthFragment({Key? key, required this.cellStrenth, required this.notation, this.meterTextSize=20}) : super(key: key);

  @override
  State<SignalStrenthFragment> createState() => _SignalStrenthFragmentState();
}

class _SignalStrenthFragmentState extends State<SignalStrenthFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromARGB(255, 230, 230, 230))
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Уровень\nсигнала',
            style: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 161, 161, 161),
              overflow: TextOverflow.visible,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SignalStrengthIndicator.bars(
                value: 0.1,
                size: 1,
                barCount: 3,
                spacing: 0.7,
                inactiveColor: const Color.fromARGB(255, 208, 208, 208),
                activeColor: const Color.fromARGB(255, 244, 117, 0),
                radius: const Radius.circular(10),
              ),
              const SizedBox(width: 10,),
              Text(
                '${widget.cellStrenth}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.meterTextSize
                ),
              ),
              const SizedBox(width: 5,),
              Text(
                widget.notation.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.meterTextSize
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}
