library Ergo.component.menu;

import 'package:angular/angular.dart';


@Component(
    selector: 'menu',
    templateUrl: 'packages/Ergo/component/menu/menu.html',
    cssUrl: 'menu.css',
    useShadowDom: false)
class MenuComponent {
  int test = 3;

  @NgAttr('active-menu')
  String active;

  String checkActive(String a) {
    if(a == active) {
      return "active";
    }

    return "";
  }
}