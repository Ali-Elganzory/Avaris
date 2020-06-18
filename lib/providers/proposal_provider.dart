import 'package:flutter/material.dart';

import '../models/category.dart' as proposal;

class ProposalProvider extends ChangeNotifier {
  List<proposal.Category> _categories = [
    proposal.Category(
      name: "Maps",
      items: [
        proposal.CategoryItem(
          name: "Routing1",
          image: 'images/routing.png',
          weight: 5.0,
          description: "Routing1 is bla bla",
        ),
        proposal.CategoryItem(
          name: "Routing2",
          image: 'images/routing.png',
          weight: 6.0,
          description: "Routing2 is bla bla",
        ),
        proposal.CategoryItem(
          name: "Routing3",
          image: 'images/routing.png',
          weight: 3.0,
          description: "Routing3 is bla bla",
        ),
      ],
    ),
    proposal.Category(
      name: "Maps2",
      items: [
        proposal.CategoryItem(
          name: "Routing4",
          image: 'images/routing.png',
          weight: 1.0,
          description: "Routing4 is bla bla",
        ),
        proposal.CategoryItem(
          name: "Routing5",
          image: 'images/routing.png',
          weight: 6.75,
          description: "Routing5 is bla bla",
        ),
        proposal.CategoryItem(
          name: "Routing6",
          image: 'images/routing.png',
          weight: 8.9,
          description: "Routing6 is bla bla",
        ),
      ],
    ),
    proposal.Category(
      name: "Maps3",
      items: [
        proposal.CategoryItem(
          name: "Routing7",
          image: 'images/routing.png',
          weight: 1.0,
          description: "Routing7 is bla bla",
        ),
        proposal.CategoryItem(
          name: "Routing8",
          image: 'images/routing.png',
          weight: 6.75,
          description: "Routing8 is bla bla",
        ),
        proposal.CategoryItem(
          name: "Routing9",
          image: 'images/routing.png',
          weight: 8.9,
          description: "Routing9 is bla bla",
        ),
      ],
    ),
    proposal.Category(
      name: "Maps4",
      items: [
        proposal.CategoryItem(
          name: "Routing10",
          image: 'images/routing.png',
          weight: 1.0,
          description: "Routing10 is bla bla",
        ),
        proposal.CategoryItem(
          name: "Routing11",
          image: 'images/routing.png',
          weight: 6.75,
          description: "Routing11 is bla bla",
        ),
        proposal.CategoryItem(
          name: "Routing12",
          image: 'images/routing.png',
          weight: 8.9,
          description: "Routing12 is bla bla",
        ),
      ],
    ),
  ];
  List<proposal.CategoryItem> _selectedItems = [];

  proposal.CategoryItem acceptedData;

  bool _isEmpty = true;

  bool get isEmpty => _isEmpty;

  set isEmpty(bool val) {
    _isEmpty = val;
    notifyListeners();
  }

  List<proposal.Category> get itemsList => _categories;

  proposal.CategoryItem get getAcceptedData => acceptedData;

  List<proposal.CategoryItem> get selectedItems => _selectedItems;

  changeAcceptedData(proposal.CategoryItem data) {
    acceptedData = data;
    notifyListeners();
  }

  removeItem(proposal.CategoryItem item, String name) {
    _selectedItems.firstWhere((element) => element == item);
    notifyListeners();
  }

  addItemToList(proposal.CategoryItem item) {
    _selectedItems.add(item);
    notifyListeners();
  }
}
