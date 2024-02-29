import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/text_container.dart';

class PopUpMeteringWidget extends StatelessWidget {
  const PopUpMeteringWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
      backgroundColor: Color(0xFFFFFFFF),
      contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/hot.png'),
          Text(ContainerExtractor.extract(
            textContainer, 'PopUpMeteringWidget.Header1'),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
          ),
          Text(
            ContainerExtractor.extract(
                textContainer, 'PopUpMeteringWidget.Describe1'),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            ContainerExtractor.extract(
                textContainer, 'PopUpMeteringWidget.Describe2'),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            width: double.maxFinite,
            height: 45,
            child:TextButton(
            onPressed: () => Navigator.of(context).pop(), 
            style: const ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
              backgroundColor: MaterialStatePropertyAll(Color(0xff0085ff)),
              foregroundColor: MaterialStatePropertyAll(Color(0xffffffff)),
            ),
            child: Text(
              ContainerExtractor.extract(textContainer, 'PopUpMeteringWidget.Button'),
              style: TextStyle(fontWeight: FontWeight.w500),
              ),
            )
          )
        ],
      ),
    );
  }
}