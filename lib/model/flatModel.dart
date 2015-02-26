library Ergo.model.flatModel;

class FlatModel {
  String id;
  String name;
  String content;
  String url;
  String location;

  FlatModel(this.id, this.name, this.content, this.url, this.location);


  // create a json from this object
  Map<String, dynamic> toJson() => <String, dynamic>{
      "id": id,
      "name": name,
      "content": content,
      "url": url,
      "location": location
  };

  // generate a object from json
  FlatModel.fromJson(Map<String, dynamic> json): this(json['id'], json['name'], json['content'],
  json['url'], json['location']);
}