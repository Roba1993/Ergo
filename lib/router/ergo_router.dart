library Ergo.router.router;

import 'package:angular/angular.dart';

void ergoRouteInitializer(Router router, RouteViewFactory views) {

  views.configure({
      'news' : ngRoute(path: '/news', view: 'view/news.html', defaultRoute: true),
      'category': ngRoute(path: '/category', view: 'view/category.html'),
      'provider': ngRoute(path: '/provider', view: 'view/provider.html')
  });

}