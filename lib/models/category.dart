import 'package:flutter/foundation.dart';

class Category {
  final String name;
  final List<CategoryItem> items;

  Category({
    @required this.name,
    @required this.items,
  });
}

class CategoryItem {
  final String name;
  final String image;
  final double weight;
  final String description;
  

  CategoryItem({
    @required this.name,
    @required this.image,
    @required this.weight,
    @required this.description,
  });
}
