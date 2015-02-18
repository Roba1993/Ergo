library Ergo.component.category;

import 'package:angular/angular.dart';

@Component(
    selector: 'category',
    templateUrl: 'packages/Ergo/component/category/category.html',
    cssUrl: 'category.css',
    useShadowDom: false)
class CategoryComponent {
  List<CategoryModel> categories = new List<CategoryModel>();

  CategoryComponent() {
    categories.add(new CategoryModel("Allgemeine Infos"));
    categories.add(new CategoryModel("Versicherungen"));
    categories.add(new CategoryModel("Bla Infos"));
    categories.add(new CategoryModel("Haste noch nicht gesehen"));
  }
}


class CategoryModel {
  String title;

  CategoryModel(this.title);
}