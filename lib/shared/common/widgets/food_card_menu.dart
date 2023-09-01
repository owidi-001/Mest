// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:mest/models/book/book_model.dart';
// import 'package:mest/common/theme/font.dart';
// import 'package:mest/common/theme/theme.dart';
// import 'package:mest/common/utils/utils.dart';

// class FoodCard extends StatelessWidget {
//   final Food item;
//   final Function() action;
//   const FoodCard({super.key, required this.item, required this.action});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: action,
//       child: Card(
//         color: AppTheme.light,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(PADDING / 2),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(12),
//                 ),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(PADDING / 4),
//                 child: item.image.toString().isNotEmpty
//                     ? Image.memory(
//                         const Base64Decoder().convert(item.name),
//                       )
//                     // ? Image.asset(
//                     //     item.image,
//                     //     fit: BoxFit.fitWidth,
//                     //   )
//                     : Container(
//                         height: 200,
//                         decoration: BoxDecoration(
//                             color: AppTheme.gold,
//                             borderRadius: BorderRadius.circular(PADDING / 4)),
//                       ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.all(PADDING / 2),
//               child: Text(
//                 "Snack",
//                 style: TextStyle(color: Colors.grey, fontSize: 12),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(PADDING / 2),
//               child: Text(
//                 item.image,
//                 style: AppFont.normal,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
