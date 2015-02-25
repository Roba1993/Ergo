library Ergo.component.comments;

import 'package:angular/angular.dart';
import 'package:Ergo/model/commentModel.dart';

@Component(
    selector: 'comments',
    templateUrl: 'packages/Ergo/component/comments/comments.html',
    cssUrl: 'comments.css',
    useShadowDom: false)
class CommentsComponent {
  final Http _http;
  var comments;

  CommentsComponent(this._http, RouteProvider routeProvider) {
    _http.get('comments.json').then((HttpResponse response) {
      comments =  response.data.map((d) => new CommentModel.fromJson(d)).toList();
    })
    .catchError((e) {
      print(e);
    });
  }

}