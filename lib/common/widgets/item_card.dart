// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:mest/models/book/book_model.dart';
// import 'package:mest/common/theme/theme.dart';

// class MenuCard extends StatelessWidget {
//   Food food;
//   MenuCard({super.key, required this.food});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: AppTheme.gold,
//         borderRadius: BorderRadius.all(
//           Radius.circular(12),
//         ),
//       ),
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10.0),
//             child: food.image.isNotEmpty
//                 ? Image.memory(const Base64Decoder().convert(food.image))
//                 : Container(
//                     decoration: BoxDecoration(
//                         color: AppTheme.gold,
//                         borderRadius: BorderRadius.circular(12)),
//                   ),
//           ),
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
//             child: Text(
//               food.name,
//               style: const TextStyle(
//                   color: AppTheme.gold,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           const Positioned(
//               bottom: 10,
//               right: 10,
//               child: CircleAvatar(
//                 backgroundColor: AppTheme.gold,
//                 child: Icon(
//                   Icons.edit,
//                   color: AppTheme.light,
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
