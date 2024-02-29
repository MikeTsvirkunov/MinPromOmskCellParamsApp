import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minprom_of_omsk_signal/app/data_page/popup_sorting_widget/sort_row.dart';
import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/global_values/sorting_filters_container.dart';
import 'package:minprom_of_omsk_signal/global_values/value_container.dart';


enum SingingCharacter { lafayette, jefferson }


class PopUpSortingWidget extends StatefulWidget {
  const PopUpSortingWidget({super.key});

  @override
  State<PopUpSortingWidget> createState() => _PopUpSortingWidgetState();
}

class _PopUpSortingWidgetState extends State<PopUpSortingWidget> {
  
  SingingCharacter? x = SingingCharacter.jefferson;
  @override
  Widget build(BuildContext context) {

    
    var filterList = ContainerExtractor.extract<List<String>>(sortingFilterContainer, 'HistoryBlock.Filters.List');
    List<Widget> listOfRows = List.generate(filterList.length, (index) => SortingRow(value: filterList[index], uppdate: () => setState(() {}),));
    List<Widget> mainList = [
      Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Text('Сортировать по', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),))
    ];
    mainList.addAll(listOfRows);
    mainList.add(TextButton(onPressed: (){
      ContainerExtractor.extract(valueContainer, 'HistList.Updater')();
    }, child: Text('Применить')));
    return Dialog(
      backgroundColor: Color(0xffffffff),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15), bottom: Radius.circular(0))),
      insetPadding: EdgeInsets.all(0),
      alignment: Alignment.bottomCenter,
      child:  Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: mainList,
      )),
      // child: ListView.builder(
      //   itemCount: ,
      //   itemBuilder: ()
      // ),
    );
  }
}
