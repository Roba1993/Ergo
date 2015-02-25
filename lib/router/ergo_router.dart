library Ergo.router.router;

import 'package:angular/angular.dart';

void ergoRouteInitializer(Router router, RouteViewFactory views) {

  views.configure({
      'news' : ngRoute(path: '/news', view: 'view/news.html', defaultRoute: true),
      'news-view' : ngRoute(path: '/news/:id', view: 'view/news_view.html'),
      'map': ngRoute(path: '/map', view: 'view/map.html'),
      'provider': ngRoute(path: '/provider', view: 'view/provider.html'),
      'provider-view': ngRoute(path: '/provider/:provider', view: 'view/provider_view.html'),
      'insurance': ngRoute(path: '/provider/:provider/insurance', view: 'view/insurance.html'),
      'insurance-site': ngRoute(path: '/provider/:provider/insurance/:site', view: 'view/insurance.html')
  });

}