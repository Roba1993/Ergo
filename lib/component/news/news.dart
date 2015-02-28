library Ergo.component.news;

import 'package:angular/angular.dart';
import 'package:Ergo/model/newsModel.dart';

@Component(
    selector: 'news',
    templateUrl: 'packages/Ergo/component/news/news.html',
    cssUrl: 'news.css',
    useShadowDom: false)
class NewsComponent {
  List<NewsModel> news = new List<NewsModel>();
  List<NewsModel> topnews = new List<NewsModel>();
  final Http _http;
  String link = "2";

  NewsComponent(this._http) {
    _http.get('news.json').then((HttpResponse response) {
      var nn =  response.data.map((d) => new NewsModel.fromJson(d)).toList();

      for(NewsModel n in nn) {
        if(n.isTopnews == 'true') {
          topnews.add(n);
        }
        else {
          news.add(n);
        }
      }
    })
    .catchError((e) {
      print(e);
    });
  }



  short(String input) {
    input = removeHtml(input);

    if(input.length > 110) {
      input = input.substring(0, input.indexOf(" ", 110));
      input = input + " ...";
    }

    return input;
  }

  removeHtml(String input) {
    while(input.indexOf("<") >= 0) {
      input = input.substring(0, input.indexOf("<")) + input.substring(input.indexOf(">") + 1);
    }
    return input;
  }
}