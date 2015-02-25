library Ergo.model.commentModel;

class CommentModel {
  String id;
  String name;
  String content;
  String urlPic;

  CommentModel(this.id, this.name, this.content, this.urlPic);


  // create a json from this object
  Map<String, dynamic> toJson() => <String, dynamic>{
      "id": id,
      "name": name,
      "content": content,
      "urlPic": urlPic
  };

  // generate a object from json
  CommentModel.fromJson(Map<String, dynamic> json): this(json['id'], json['name'], json['content'],
  json['urlPic']);
}