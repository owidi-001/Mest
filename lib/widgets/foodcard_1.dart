// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:mest/models/food.model.dart';
// import 'package:mest/services/food.service.dart';
// import 'package:mest/theme/theme.dart';
// import 'package:mest/utils/constants.dart';

// class FoodCard extends StatefulWidget {
//   const FoodCard({Key? key}) : super(key: key);

//   @override
//   State<FoodCard> createState() => _FoodCardState();
// }

// class _FoodCardState extends State<FoodCard> {
//   Food food = Food(name: "Carrots", image: "${baseUrl}carrots.png");

//   void _suggestFood() {
//     setState(() {
//       food = randomFood();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (kDebugMode) {
//       print(food.image);
//     }
//     return InkWell(
//       // onTap: () => onTapCallback(),
//       child: Card(
//           color: AppTheme.lightColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16.0),
//           ),
//           elevation: 0,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Flex(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               direction: Axis.vertical,
//               children: <Widget>[
//                 Flexible(
//                   flex: 2,
//                   child: Image.asset(
//                     food.image,
//                     // width: 120,
//                     // height: 120,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 12,
//                 ),
//                 FractionallySizedBox(
//                   alignment: Alignment.bottomCenter,
//                   child: Container(
//                     padding: const EdgeInsets.all(16.0),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: AppTheme.secondaryColor,
//                       boxShadow: const [
//                         BoxShadow(color: AppTheme.primaryColor, spreadRadius: 3),
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         Container(
//                           alignment: Alignment.center,
//                           child: Text(
//                             food.name,
//                             style: const TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black54),
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: const [
//                             Text(
//                               "\$20,99",
//                               style: TextStyle(
//                                   color: Colors.red,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             // Image.asset(
//                             //   "assets/images/add_icon.png",
//                             //   width: 32,
//                             //   height: 32,
//                             // )
//                             Icon(
//                               CupertinoIcons.cart,
//                               size: 32,
//                             )
//                           ],
//                         ),
//                         FractionallySizedBox(
//                           alignment: Alignment.bottomCenter,
//                           widthFactor: 0.8,
//                           child: ElevatedButton(
//                               onPressed: _suggestFood,
//                               child: const Text("Suggest")),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }
