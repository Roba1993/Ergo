import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:angular/routing/module.dart';
import 'package:angular_ui/angular_ui.dart';

import 'package:Ergo/router/ergo_router.dart';
import 'package:Ergo/component/menu/menu.dart';

class MainModule extends Module {

  MainModule() {
    // bind components
    //bind(AlertComponent);
    bind(MenuComponent);

    // Route configuration
    bind(RouteInitializerFn, toValue: ergoRouteInitializer);
    bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));
  }


}

void main() {
  applicationFactory()
    .addModule(new MainModule())
    .addModule(new AngularUIModule())
    .run();
}