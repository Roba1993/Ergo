library Ergo.component.provider_view;

import 'package:angular/angular.dart';
import 'package:Ergo/model/providerModel.dart';

@Component(
    selector: 'provider-view',
    templateUrl: 'packages/Ergo/component/provider_view/provider_view.html',
    cssUrl: 'provider_view.css',
    useShadowDom: false)
class ProviderViewComponent {
  ProviderModel provider;
  final Http _http;

 ProviderViewComponent(this._http, RouteProvider routeProvider) {
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
