// import 'package:flutter/material.dart';

// import './draggableWidget.dart';

// class CategoryTile extends StatefulWidget {
//   @override
//   _CategoryTileState createState() => _CategoryTileState();
// }

// class _CategoryTileState extends State<CategoryTile> {
//   @override
//   Widget build(BuildContext context) {
//     bool expanded = false;

//     return MouseRegion(
//       onHover: (pointer) {
//         print(expanded);
//         setState(() {
//           expanded = true;
//         });
//       },
//       onExit: (pointer) {
//         print(expanded);
//         setState(() {
//           expanded = false;
//         });
//       },
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 500),
//         height: 200,
//         width: expanded ? 500 : 200,
//         // child: DraggableTile(),
//       ),
//     );
//   }
// }
