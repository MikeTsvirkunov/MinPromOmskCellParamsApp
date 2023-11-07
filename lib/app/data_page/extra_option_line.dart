import 'package:flutter/material.dart';

class AnotherOptionRow extends StatefulWidget {
  final String paramName;
  final String paramValue;
  const AnotherOptionRow(
      {Key? key, required this.paramName, required this.paramValue,})
      : super(key: key);

  @override
  State<AnotherOptionRow> createState() => _AnotherOptionRowState();
}

class _AnotherOptionRowState extends State<AnotherOptionRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.paramName),
        Text(widget.paramValue)
      ],
    );
  }
}
