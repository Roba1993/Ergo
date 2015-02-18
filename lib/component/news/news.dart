library Ergo.component.news;

import 'package:angular/angular.dart';

@Component(
    selector: 'news',
    templateUrl: 'packages/Ergo/component/news/news.html',
    cssUrl: 'news.css',
    useShadowDom: false)
class NewsComponent {
  List<NewsModel> news = new List<NewsModel>();

  NewsComponent() {
    news.add(new NewsModel("Test1", "Content 1"));
    news.add(new NewsModel("Test2", "Content 2"));
    news.add(new NewsModel("Test3", "Content 3"));
    news.add(new NewsModel("Test4", "Content 4"));
  }
}


class NewsModel {
  String title;
  String content;

  NewsModel(this.title, this.content);
}