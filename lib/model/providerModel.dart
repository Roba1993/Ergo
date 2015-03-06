library Ergo.model.providerModel;

/**
 * Class to hold the provider data
 */
class ProviderModel {
  String name;
  String pictureUrl;
  String url;
  String description;
  String description2;

  // the constructor
  ProviderModel(this.name, this.description, this.description2, this.pictureUrl, this.url);

  // create a json from this object
  Map<String, dynamic> toJson() => <String, dynamic>{
      "name": name,
      "description": description,
      "description2": description2,
      "pictureUrl": pictureUrl,
      "url": url
  };

  // generate a object from json
  ProviderModel.fromJson(Map<String, dynamic> json): this(json['name'], json['description'], json['description2'], json['pictureUrl'], json['url']);
}