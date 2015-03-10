import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:angular/routing/module.dart';
import 'package:angular_ui/angular_ui.dart';

import 'package:Ergo/router/ergo_router.dart';
import 'package:Ergo/component/menu/menu.dart';
import 'package:Ergo/component/news/news.dart';
import 'package:Ergo/component/provider/provider.dart';
import 'package:Ergo/component/map/map.dart';
import 'package:Ergo/component/provider_view/provider_view.dart';
import 'package:Ergo/component/insurance/insurance.dart';
import 'package:Ergo/component/news_view/news_view.dart';
import 'package:Ergo/component/comments/comments.dart';
import 'package:Ergo/component/insurance_map/insurance_map.dart';
import 'dart:html';

class MainModule extends Module {

  MainModule() {
    // bind components
    bind(MenuComponent);
    bind(NewsComponent);
    bind(NewsViewComponent);
    bind(ProviderComponent);
    bind(ProviderViewComponent);
    bind(MapComponent);
    bind(InsuranceComponent);
    bind(CommentsComponent);
    bind(InsuranceMapComponent);

    // set the allowed html tags
    bind(NodeValidator, toFactory: () {
      final validator = new NodeValidatorBuilder()
        ..allowImages()
        ..allowElement('A', attributes: ['href','onclick','target'])
        ..allowElement('BUTTON', attributes: ['btn-radio', 'btn-checkbox', 'btn-checkbox-false', 'btn-checkbox-true', 'popover', 'popover-animation', 'popover-placement', 'popover-title', 'popover-trigger', 'tooltip'])
        ..allowElement('DIV', attributes: ['class', 'collapse', 'style'])
        ..allowElement('FORM', attributes: ['class','role'])
        ..allowElement('I', attributes: ['class','style'])
        ..allowElement('IMG', attributes: ['class','style','src'])
        ..allowElement('H1', attributes: ['class','style'])
        ..allowElement('H2', attributes: ['class','style'])
        ..allowElement('H3', attributes: ['class','style'])
        ..allowElement('P', attributes: ['class','style'])
        ..allowElement('TABLE', attributes: ['class','style'])
        ..allowElement('TBODY', attributes: ['class','style'])
        ..allowElement('UL', attributes: ['class','style'])
        ..allowElement('LI', attributes: ['class','style'] )
        ..allowElement('TR', attributes: ['class','style'])
        ..allowElement('TD', attributes: ['class','style','align','colspan'])
        ..allowElement('BR', attributes: ['class','style'])
        ..allowElement('STRONG', attributes: ['class', 'style'])
        ..allowElement('B', attributes: ['class','style']);

      return validator;
    });

    // Route configuration
    bind(RouteInitializerFn, toValue: ergoRouteInitializer);
    bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));
  }


}

void main() {
  applicationFactory()
    .addModule(new AngularUIModule())
    .addModule(new MainModule())
    .run();
}