import 'package:minprom_of_omsk_signal/container/container_extractor.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_action.dart';
import 'package:minprom_of_omsk_signal/interfaces/interface_extractable.dart';

class MacroAction extends IAction {
  List<IAction> listOfActions = [];
  MacroAction(this.listOfActions);
  @override
  void action(IExtractable? arg) {
    List<IExtractable?> params = ContainerExtractor.extract<List<IExtractable?>>(arg!, 'params');
    Map.fromIterables(listOfActions, params).forEach((key, value) {key.action(value);});
  }
}
// class N extends Iterable{
//   @override
//   Iterator get iterator => iterator;
// }
