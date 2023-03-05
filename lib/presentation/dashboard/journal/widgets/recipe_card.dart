// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:mest/models/recipe.model.dart';
// import 'package:mest/common/theme/theme.dart';
// import 'package:mest/common/utils/utils.dart';

// class RecipeCard extends StatelessWidget {
//   final Recipe recipe;
//   const RecipeCard({super.key, required this.recipe});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(PADDING),
//       decoration: BoxDecoration(
//           color: Colors.blueGrey,
//           borderRadius: BorderRadius.circular(PADDING / 2)),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CircleAvatar(
//             backgroundColor: AppTheme.dark,
//             child: recipe.image != null
//                 ? Image.memory(
//                     const Base64Decoder().convert(recipe.image!),
//                   )
//                 : Text(
//                     recipe.name.substring(0, 1),
//                   ),
//           ),
//           const SizedBox(
//             width: PADDING,
//           ),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   recipe.name,
//                   style: const TextStyle(
//                       color: AppTheme.light,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: "poppins"),
//                 ),
//                 const SizedBox(
//                   height: PADDING,
//                 ),
//                 ...List.generate(
//                     recipe.steps.length,
//                     (index) => Text(
//                           "- ${recipe.steps[index].description}",
//                           style: const TextStyle(
//                               color: Colors.white70,
//                               fontSize: 14,
//                               fontWeight: FontWeight.normal,
//                               fontFamily: "poppins"),
//                         ))
//               ],
//             ),
//           ),
//           Checkbox(
//             value: true,
//             onChanged: (bool? value) {},
//             shape: const CircleBorder(),
//             checkColor: AppTheme.light,
//             fillColor: MaterialStateProperty.resolveWith<Color>(
//                 (Set<MaterialState> states) {
//               if (states.contains(MaterialState.disabled)) {
//                 return AppTheme.gray;
//               }
//               return AppTheme.gray;
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }
