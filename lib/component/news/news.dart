library Ergo.component.news;

import 'package:angular/angular.dart';
import 'package:Ergo/model/newsModel.dart';

@Component(
    selector: 'news',
    templateUrl: 'packages/Ergo/component/news/news.html',
    cssUrl: 'news.css',
    useShadowDom: false)
class NewsComponent {
  var news;
  final Http _http;

  NewsComponent(this._http) {
    _http.get('news.json').then((HttpResponse response) {
      news =  response.data.map((d) => new NewsModel.fromJson(d)).toList();
    })
    .catchError((e) {
      print(e);
    });
  }
}