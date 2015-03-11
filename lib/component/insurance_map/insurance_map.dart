library Ergo.component.insurance_map;

import 'package:angular/angular.dart';
import 'package:Ergo/model/providerModel.dart';
import 'package:Ergo/model/flatModel.dart';
import 'package:intl/intl.dart';

@Component(
    selector: 'insurance-map',
    templateUrl: 'packages/Ergo/component/insurance_map/insurance_map.html',
    cssUrl: 'insurance_map.css',
    useShadowDom: false)
class InsuranceMapComponent {
  var site;
  final Http _http;
  final format = new NumberFormat("###.0#", "en_US");

  FlatModel flat;
  num persons = 2;
  num price = 100;
  DateTime start;
  DateTime end;

  InsuranceMapComponent(this._http, RouteProvider routeProvider) {
    // get the data from the json file
    _http.get('flats.json').then((HttpResponse response) {
      // create objects from the rest
      var prov = response.data.map((d) => new FlatModel.fromJson(d)).toList();
      // search the selected provider
      for(FlatModel p in prov) {
        // set the provider
        if(p.id == routeProvider.parameters['id']) {
          flat = p;
          return;
        }
      }
    })
    .catchError((e) {
      print(e);
    });

    site = routeProvider.parameters['site'];
  }

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
