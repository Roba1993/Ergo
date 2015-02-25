library Ergo.component.insurance;

import 'package:angular/angular.dart';
import 'package:Ergo/model/providerModel.dart';

@Component(
    selector: 'insurance',
    templateUrl: 'packages/Ergo/component/insurance/insurance.html',
    cssUrl: 'insurance.css',
    useShadowDom: false)
class InsuranceComponent {
  ProviderModel provider;
  var site;
  final Http _http;

  var name;
  num size = 10;
  num price = 100;
  DateTime start;
  DateTime end;
  var street;
  var city;
  var country;
  var card;
  var secret;
  var expire;

  InsuranceComponent(this._http, RouteProvider routeProvider) {
    // get the data from the json file
    _http.get('provider.json').then((HttpResponse response) {
      // create objects from the rest
      var prov = response.data.map((d) => new ProviderModel.fromJson(d)).toList();
      // search the selected provider
      for(ProviderModel p in prov) {
        // set the provider
        if(p.name == routeProvider.parameters['provider']) {
          provider = p;
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

  num calcPrice() => ((price/30) + (0.001*size*150)) * ((100+calcDays()) / 100);
}
