library Ergo.component.provider;

import 'package:angular/angular.dart';

@Component(
    selector: 'provider',
    templateUrl: 'packages/Ergo/component/provider/provider.html',
    cssUrl: 'provider.css',
    useShadowDom: false)
class ProviderComponent {
  List<ProviderModel> provider = new List<ProviderModel>();

 ProviderComponent() {
    provider.add(new ProviderModel("Test1", "Content 1"));
    provider.add(new ProviderModel("Test2", "Content 2"));
    provider.add(new ProviderModel("Test3", "Content 3"));
    provider.add(new ProviderModel("Test4", "Content 4"));
  }
}


class ProviderModel {
  String title;
  String content;

  ProviderModel(this.title, this.content);
}