// // widgets/custom_page_transition.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomPageTransition extends CustomTransition {
//   final AxisDirection direction;

//   CustomPageTransition({required this.direction});

//   @override
//   Widget buildTransition(
//     BuildContext context,
//     Curve? curve,
//     Alignment? alignment,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//   ) {
//     final offset = _getOffsetForDirection(direction);
//     return SlideTransition(
//       position: Tween<Offset>(
//         begin: offset,
//         end: Offset.zero,
//       ).animate(
//         CurvedAnimation(
//           parent: animation,
//           curve: curve ?? Curves.easeInOut,
//         ),
//       ),
//       child: child,
//     );
//   }

//   Offset _getOffsetForDirection(AxisDirection direction) {
//     switch (direction) {
//       case AxisDirection.up:
//         return const Offset(0, 1);
//       case AxisDirection.down:
//         return const Offset(0, -1);
//       case AxisDirection.right:
//         return const Offset(-1, 0);
//       case AxisDirection.left:
//         return const Offset(1, 0);
//     }
//   }
// }
