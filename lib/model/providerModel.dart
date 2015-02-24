library Ergo.model.providerModel;

/**
 * Class to hold the provider data
 */
class ProviderModel {
  String name;
  String pictureUrl;
  String url;
  String description;

  // the constructor
  ProviderModel(this.name, this.description, this.pictureUrl, this.url);

  // create a json from this object
  Map<String, dynamic> toJson() => <String, dynamic>{
      "name": name,
      "description": description,
      "pictureUrl": pictureUrl,
      "url": url
  };

  // generate a object from json
  ProviderModel.fromJson(Map<String, dynamic> json): this(json['name'], json['description'], json['pictureUrl'],
  json['url']);
}