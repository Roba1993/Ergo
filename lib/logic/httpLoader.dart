library Ergo.logic.httpLoader;

import 'package:angular/angular.dart';
import 'package:Ergo/model/providerModel.dart';

class HttpLoader {
  final Http _http;

  HttpLoader(this._http);

  loadProvider() {
    _http.get('provider.json').then((HttpResponse response) {
      print("Output");
      print(response);
      return response.data.map((d) => new ProviderModel.fromJson(d)).toList();
    })
    .catchError((e) {
      print("Error");
      print(e);
    });
  }
}