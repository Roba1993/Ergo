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
  final Http _http;

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
  }
}
