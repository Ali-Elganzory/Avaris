import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/category.dart' as proposal;
import '../../providers/proposal_provider.dart';

class Target extends StatelessWidget {
  bool val = false;
  String recieved;
  @override
  Widget build(BuildContext context) {
    print("Building");
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;

    return Selector<ProposalProvider, bool>(
      selector: (context, provider) => provider.isEmpty,
      builder: (context, isEmpty, _) {
        print(isEmpty);
        return Center(
          child: DragTarget(
            builder: (context, List<String> recievedData, rejectedData) {
              print(recievedData);
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 1000),
                child: isEmpty
                    ? Container(
                        key: UniqueKey(),
                        height: sh * 0.7,
                        width: sw * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'images/phone-frame.png',
                            ),
                          ),
                        ),
                      )
                    : Container(
                        key: UniqueKey(),
                        height: sh * 0.7,
                        width: sw * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              recieved,
                            ),
                          ),
                        ),
                      ),
              );
            },
            onWillAccept: (data) {
              print(data);
              return true;
            },
            onAccept: (data) {
              recieved = data;
              Provider.of<ProposalProvider>(context, listen: false).isEmpty =
                  false;
            },
          ),
        );
      },
    );
  }
}
