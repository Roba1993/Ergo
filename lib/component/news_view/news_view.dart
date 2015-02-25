library Ergo.component.news_view;

import 'package:angular/angular.dart';
import 'package:Ergo/model/newsModel.dart';

@Component(
    selector: 'news-view',
    templateUrl: 'packages/Ergo/component/news_view/news_view.html',
    cssUrl: 'news_view.css',
    useShadowDom: false)
class NewsViewComponent {
  final Http _http;
  var news;

  NewsViewComponent(this._http, RouteProvider routeProvider) {
    _http.get('news.json').then((HttpResponse response) {
      var n =  response.data.map((d) => new NewsModel.fromJson(d)).toList();
      for(NewsModel nm in n) {
        if(nm.id == routeProvider.parameters['id']) {
          news = nm;
        }
      }
    })
    .catchError((e) {
      print(e);
    });
  }

}