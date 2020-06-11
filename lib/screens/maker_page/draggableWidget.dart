import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/proposal_provider.dart';
import '../../models/category.dart' as proposal;

class DraggableWidget extends StatelessWidget {
  DraggableWidget({
    Key key,
    @required this.i,
  }) : super(key: key);

  final int i;

  proposal.CategoryItem item;

  @override
  Widget build(BuildContext context) {
    print(
        'List last index  is ${Provider.of<ProposalProvider>(context).itemsList.length - 1}');
    return Draggable(
      data: Provider.of<ProposalProvider>(context).itemsList[i],
      childWhenDragging: Container(
        height: 200.0,
        width: 200.0,
        child: Card(
          elevation: 2.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: i >= 1 ? Colors.amber : Colors.grey,
          child: Center(
            child: Text(
              i >= 1
                  ? '${Provider.of<ProposalProvider>(context).itemsList.elementAt((Provider.of<ProposalProvider>(context).itemsList.length - 1) - 1).name}'
                  : "NO_ITEMS_LEFT",
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
          ),
        ),
      ),
      feedback: Container(
        height: 200.0,
        width: 200.0,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 2.0,
          color: Colors.amber,
          child: Center(
              child: Text(
            '${Provider.of<ProposalProvider>(context).itemsList[i].name}',
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          )),
        ),
      ),
      child: Container(
        height: 200.0,
        width: 200.0,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 2.0,
          color: Colors.amber,
          child: Center(
              child: Text(
            '${Provider.of<ProposalProvider>(context).itemsList[i].name}',
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          )),
        ),
      ),
    );
  }
}

class DraggableTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Draggable(
      data: ["images/routing.png"],
      child: Container(
        height: 200.0,
        width: 200.0,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 2.0,
          color: Colors.amber,
          child: Center(
            child: Text(
              "Routing",
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
          ),
        ),
      ),
      feedback: Container(
        height: 200.0,
        width: 200.0,
        child: Image.asset("images/routing2.jpg"),
      ),
    );
  }
}
