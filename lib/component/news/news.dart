library Ergo.component.news;

import 'package:angular/angular.dart';
import 'package:Ergo/model/newsModel.dart';

@Component(
    selector: 'news',
    templateUrl: 'packages/Ergo/component/news/news.html',
    exportExpressions: const ['myIntervalAsString', 'myInterval', 'slides', 'image', 'text', 'addSlide'],
    cssUrl: 'news.css',
    useShadowDom: false)
class NewsComponent {
  var news;
  final Http _http;


// workaround until number conversion is supported by Angular
  String _myInterval = '5000';
  String get myIntervalAsString => _myInterval;
  set myIntervalAsString(String newVal) {
    _myInterval = newVal;
    try {
      myInterval = int.parse(newVal);
    } catch(e){}
  }
  // workaround end

  int myInterval = 5000;
  List<Map<String,dynamic>> slides = [];

  void addSlide() {
    int newWidth = 600 + slides.length;
    slides.add({
        'image': 'http://placekitten.com/${newWidth}/300',
        'text': ['More','Extra','Lots of','Surplus'][slides.length % 4] + ' ' +
        ['Cats', 'Kittys', 'Felines', 'Cutes'][slides.length % 4]
    });
  }

  NewsComponent(this._http) {
    _http.get('news.json').then((HttpResponse response) {
      news =  response.data.map((d) => new NewsModel.fromJson(d)).toList();
    })
    .catchError((e) {
      print(e);
    });

    for (int i = 0; i < 4; i++) {
      addSlide();
    }
  }


}