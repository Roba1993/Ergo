library Ergo.model.newsModel;

class NewsModel {
  String id;
  String title;
  String content;
  String urlPic;
  String isTopnews;

  NewsModel(this.id, this.title, this.content, this.urlPic, this.isTopnews);


  // create a json from this object
  Map<String, dynamic> toJson() => <String, dynamic>{
      "id": id,
      "title": title,
      "content": content,
      "urlPic": urlPic,
      "isTopnews": isTopnews
  };

  // generate a object from json
  NewsModel.fromJson(Map<String, dynamic> json): this(json['id'], json['title'], json['content'],
  json['urlPic'], json['isTopnews']);
}