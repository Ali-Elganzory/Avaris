import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/navigation_bar.dart';
import '../../providers/proposal_provider.dart';
import './dragTargetWidget.dart';
import './draggableWidget.dart';
import './category_tile.dart';

class MakerPage extends StatelessWidget {
  static const String routeName = "/Maker";

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: sh,
        width: sw,
        color: Colors.blueAccent,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 100,
              left: 100,
              child: DraggableTile(
                category: Provider.of<ProposalProvider>(context, listen: false)
                    .itemsList[0],
              ),
            ),
            Target(),
            NavigationBar(),
          ],
        ),
      ),
    );
  }
}
