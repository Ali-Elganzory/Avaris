import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/category.dart' as proposal;
import '../../providers/proposal_provider.dart';

class DragTargetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DragTarget(
        onWillAccept: (data) => true,
        onAccept: (proposal.CategoryItem data) {
          if (Provider.of<ProposalProvider>(context).itemsList.length >= 1) {
            // Provider.of<Data>(context).removeLastItem();
            Provider.of<ProposalProvider>(context).changeSuccessDrop(true);
            Provider.of<ProposalProvider>(context).changeAcceptedData(data);
          }
        },
        builder: (context, List<proposal.CategoryItem> cd, rd) {
          if (Provider.of<ProposalProvider>(context).isSuccessDrop) {
            return Padding(
              padding: const EdgeInsets.all(25.0),
              child: Stack(
                children: buildTargetList(
                  Provider.of<ProposalProvider>(context).getAcceptedData,
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                  height: 200.0,
                  width: 200.0,
                  color: Colors.grey[400],
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Colors.grey[400],
                    child: Center(
                      child: Text(
                        "DROP_ITEMS_HERE",
                        style: TextStyle(color: Colors.black, fontSize: 22.0),
                      ),
                    ),
                  )),
            );
          }
        });
  }

  List<Widget> buildTargetList(proposal.CategoryItem cardItem) {
    List<Widget> targetList = [];
    targetList.add(
      Container(
        height: 200.0,
        width: 200.0,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: Colors.amber,
          child: Center(
              child: Text(
            '${cardItem.name}',
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          )),
        ),
      ),
    );
    return targetList;
  }
}

class Target extends StatelessWidget {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    print("Building");
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;

    return Center(
      child: DragTarget(
        builder: (context, List<int> candidateData, rejectedData) {
          print(candidateData);
          return Container(
            height: sh * 0.7,
            width: sw * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    !val ? 'images/phone-frame.png' : 'images/routing.png'),
              ),
            ),
          );
        },
        onWillAccept: (data) {
          return true;
        },
        onAccept: (data) {
          val = true;
          if (data % 2 == 0) {
            print("Correct");
          } else {
            print("Wrong");
          }
        },
      ),
    );
  }
}