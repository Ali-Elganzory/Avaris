import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/proposal_provider.dart';
import '../../models/category.dart' as proposal;

class DraggableTile extends StatefulWidget {
  final proposal.Category category;
  DraggableTile({@required this.category});
  @override
  _DraggableTileState createState() => _DraggableTileState();
}

class _DraggableTileState extends State<DraggableTile> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (pointer) {
        // print(expanded);
        setState(() {
          expanded = true;
        });
      },
      onExit: (pointer) {
        // print(expanded);
        setState(() {
          expanded = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: 150,
        width: expanded ? 500 : 150,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 2.0,
          color: Colors.amber,
          child: !expanded
              ? Center(
                  child: Text(
                    widget.category.name,
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                )
              : Center(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 10),
                    itemCount: widget.category.items.length,
                    itemBuilder: (context, index) {
                      return Draggable(
                        data: widget.category.items[index].image,
                        feedback: Container(
                          height: 200.0,
                          width: 200.0,
                          child: Image.asset("images/routing2.jpg"),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50.0,
                                width: 50.0,
                                child: Image.asset(
                                  "images/routing2.jpg",
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Text(
                                widget.category.items[index].name,
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
