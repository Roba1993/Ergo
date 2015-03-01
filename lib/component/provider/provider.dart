library Ergo.component.provider;

import 'package:angular/angular.dart';
import 'package:Ergo/model/providerModel.dart';

@Component(
    selector: 'provider',
    templateUrl: 'packages/Ergo/component/provider/provider.html',
    cssUrl: 'provider.css',
    useShadowDom: false)
class ProviderComponent {
  List<ProviderModel> provider;
  final Http _http;
  String selected;

 ProviderComponent(this._http) {
   _http.get('provider.json').then((HttpResponse response) {
     provider =  response.data.map((d) => new ProviderModel.fromJson(d)).toList();
   })
   .catchError((e) {
     print(e);
   });
  }
}
