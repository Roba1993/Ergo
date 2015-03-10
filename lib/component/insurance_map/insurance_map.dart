library Ergo.component.insurance_map;

import 'package:angular/angular.dart';
import 'package:Ergo/model/providerModel.dart';
import 'package:intl/intl.dart';

@Component(
    selector: 'insurance-map',
    templateUrl: 'packages/Ergo/component/insurance_map/insurance_map.html',
    cssUrl: 'insurance_map.css',
    useShadowDom: false)
class InsuranceMapComponent {
  var site;
  final format = new NumberFormat("###.0#", "en_US");

  num persons = 2;
  num price = 100;
  DateTime start;
  DateTime end;


  num calcDays() {
    if(start != null && end != null) {
      var d = end.difference(start);

      if(d.inDays > 0) {
        return d.inDays;
      }
    }

    return 0;
  }

  calcPrice() => format.format(((price/30) + (persons*7.5)) * ((100+calcDays()) / 100));
}
