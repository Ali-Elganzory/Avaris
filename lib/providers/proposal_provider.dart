import 'package:flutter/material.dart';

import '../models/category.dart' as proposal;

class ProposalProvider extends ChangeNotifier {
  List<proposal.Category> _categories = [];
  List<proposal.CategoryItem> _selectedItems = [];

  proposal.CategoryItem acceptedData;

  bool isEmpty;
  bool successDrop;

  Data() {
    successDrop = false;

    //Intialize Categories
    _categories = [
      proposal.Category(
        name: "Maps",
        items: [
          proposal.CategoryItem(
            name: "Routing1",
            image: "fds",
            weight: 5.0,
            description: "Routing1 is bla bla",
          ),
          proposal.CategoryItem(
            name: "Routing2",
            image: "fds",
            weight: 6.0,
            description: "Routing2 is bla bla",
          ),
          proposal.CategoryItem(
            name: "Routing3",
            image: "fds",
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
            image: "fds",
            weight: 1.0,
            description: "Routing4 is bla bla",
          ),
          proposal.CategoryItem(
            name: "Routing5",
            image: "fds",
            weight: 6.75,
            description: "Routing5 is bla bla",
          ),
          proposal.CategoryItem(
            name: "Routing5",
            image: "fds",
            weight: 8.9,
            description: "Routing5 is bla bla",
          ),
        ],
      ),
    ];
  }

  bool get isSuccessDrop => successDrop;

  List<proposal.Category> get itemsList => _categories;

  proposal.CategoryItem get getAcceptedData => acceptedData;

  set setSuccessDrop(bool status) {
    successDrop = status;
    notifyListeners();
  }

  changeAcceptedData(proposal.CategoryItem data) {
    acceptedData = data;
    notifyListeners();
  }

  changeSuccessDrop(bool status) {
    setSuccessDrop = status;
  }

  removeItem(proposal.CategoryItem item, String name) {
    _selectedItems.firstWhere((element) => element == item);
    notifyListeners();
  }

  addItemToList(proposal.CategoryItem item) {
    _selectedItems.add(item);
    notifyListeners();
  }

  // initializeDraggableList() {
  //   items = Constants.initializeList(items);
  //   notifyListeners();
  // }
}
