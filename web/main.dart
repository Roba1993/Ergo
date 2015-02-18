import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:angular/routing/module.dart';
import 'package:angular_ui/angular_ui.dart';

import 'package:Ergo/router/ergo_router.dart';
import 'package:Ergo/component/menu/menu.dart';
import 'package:Ergo/component/news/news.dart';
import 'package:Ergo/component/provider/provider.dart';
import 'package:Ergo/component/category/category.dart';

class MainModule extends Module {

  MainModule() {
    // bind components
    bind(MenuComponent);
    bind(NewsComponent);
    bind(ProviderComponent);
    bind(CategoryComponent);

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