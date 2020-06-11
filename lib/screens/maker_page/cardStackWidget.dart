import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/proposal_provider.dart';
import './draggableWidget.dart';

class CardStackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: cardItems(context),
    );
  }

  List<Widget> cardItems(BuildContext context) {
    var cardItemdraggable;
    List<Widget> carditemsList = [];
    if (Provider.of<ProposalProvider>(context).itemsList.length < 1) {
      cardItemdraggable = Container(
        height: 200.0,
        width: 200.0,
        child: Card(
          color: Colors.grey,
          child: Center(
              child: Text(
            "NO_ITEMS_LEFT",
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          )),
        ),
      );
    } else {
      for (int i = 0; i < Provider.of<ProposalProvider>(context).itemsList.length; i++) {
        cardItemdraggable = Container(
          child: DraggableWidget(i: i),
        );
      }
    }
    carditemsList.add(cardItemdraggable);

    return carditemsList;
  }
}
