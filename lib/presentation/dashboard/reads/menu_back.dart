// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_masonry_view/flutter_masonry_view.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mest/models/food.model.dart';
// import 'package:mest/provider/food_provider.dart';
// import 'package:mest/services/food.service.dart';
// import 'package:mest/theme/theme.dart';
// import 'package:mest/utils/utils.dart';
// import 'package:mest/widgets/app_button.dart';
// import 'package:mest/widgets/food_card_menu.dart';
// import 'package:mest/widgets/form_field.dart';

// class MenuScreen extends ConsumerStatefulWidget {
//   const MenuScreen({super.key});

//   @override
//   ConsumerState<MenuScreen> createState() => _MenuScreenState();
// }

// class _MenuScreenState extends ConsumerState<MenuScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   late List<Food> _menus;

//   // Form fields
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();

//   final ImagePicker _picker = ImagePicker();
//   XFile? image;

//   // This function will be triggered when the floating button is pressed
//   // It will also be triggered when you want to update an item
//   void _showForm(int? id) async {
//     if (id != null) {
//       // id == null -> create new item
//       // id != null -> update an existing item
//       final existingMenu = _menus.firstWhere((element) => element.id == id);
//       _nameController.text = existingMenu.name;
//       _descriptionController.text = existingMenu.description;
//     } else {
//       _nameController.text = "";
//       _descriptionController.text = "";
//     }

//     // show modalsheet
//     showModalBottomSheet(
//       backgroundColor: AppTheme.gold,
//       context: context,
//       elevation: 5,
//       isScrollControlled: true,
//       builder: (_) => Container(
//         padding: EdgeInsets.only(
//           top: 15,
//           left: 15,
//           right: 15,
//           // this will prevent the soft keyboard from covering the text fields
//           bottom: MediaQuery.of(context).viewInsets.bottom + 200,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: buildInputDecoration("Name", Icons.food_bank),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TextField(
//               controller: _descriptionController,
//               decoration: buildInputDecoration("Description", Icons.food_bank),
//             ),

//             // Test loader
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//               // height: MediaQuery.of(context).size.height * 0.2,
//               decoration: const BoxDecoration(
//                   color: AppTheme.light,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10))),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const SizedBox(
//                     height: PADDING,
//                   ),
//                   const Text(
//                     "Pick Image from",
//                     style: TextStyle(
//                         color: AppTheme.gray,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18),
//                   ),
//                   const SizedBox(
//                     height: PADDING,
//                   ),
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       TextButton.icon(
//                         onPressed: () async {
//                           // Pick an image
//                           image = await _picker.pickImage(
//                               source: ImageSource.camera,
//                               // Compress image upload
//                               maxHeight: 1024,
//                               maxWidth: 1024,
//                               imageQuality: 50);
//                           setState(() {});
//                         },
//                         icon: const Icon(
//                           Icons.camera_alt,
//                           color: AppTheme.gold,
//                         ),
//                         label: const Text(
//                           "Camera",
//                           style: TextStyle(color: AppTheme.gold),
//                         ),
//                       ),
//                       TextButton.icon(
//                         onPressed: () async {
//                           image = await _picker.pickImage(
//                               source: ImageSource.gallery);
//                           setState(() {});
//                         },
//                         icon: const Icon(
//                           Icons.photo,
//                           color: AppTheme.gold,
//                         ),
//                         label: const Text(
//                           "Gallery",
//                           style: TextStyle(color: AppTheme.gold),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: const [
//                       Icon(
//                         Icons.info,
//                         color: AppTheme.gold,
//                       ),
//                       SizedBox(
//                         width: 12,
//                       ),
//                       Text(
//                         'Take Square photos [1:1]',
//                         style: TextStyle(
//                             color: AppTheme.gray,
//                             fontWeight: FontWeight.normal,
//                             fontSize: 12),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(
//               height: 20,
//             ),

//             id != null
//                 ? Row(
//                     children: [
//                       Expanded(
//                         child: AppButton(
//                           title: "Update",
//                           onTap: (() async {
//                             await _updateMenu(id);
//                             ScaffoldMessenger.of(context)
//                                 .showSnackBar(const SnackBar(
//                               content: Text('Item Updated!'),
//                             ));
//                           }),
//                           background: AppTheme.green,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: PADDING,
//                       ),
//                       Expanded(
//                         child: AppButton(
//                           title: "Delete",
//                           onTap: (() async {
//                             await FoodService.deleteItem(id);
//                             ScaffoldMessenger.of(context)
//                                 .showSnackBar(const SnackBar(
//                               content: Text('Item removed!'),
//                             ));
//                           }),
//                           background: AppTheme.red,
//                         ),
//                       ),
//                     ],
//                   )
//                 : AppButton(
//                     title: "Create new",
//                     onTap: (() async {
//                       await _addMenu();
//                     }),
//                     background: AppTheme.green,
//                   )
//           ],
//         ),
//       ),
//     );
//   }

//   // Insert a new journal to the database
//   Future<void> _addMenu() async {
//     if (image != null) {
//       // convert image to base64
//       String imageData = "";

//       File imagefile = File(image!.path); //convert Path to File
//       Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
//       imageData = base64.encode(imagebytes); //convert bytes to base64 string

//       // await FoodService.createItem(
//       //     _nameController.text, imageData, _descriptionController.text);

//       var res = await ref
//           .read(foodProvider)
//           .create(imageData, _nameController.text, _descriptionController.text);

//       if (res) {
//         Navigator.of(context).pop();
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text('Menu added successfully!'),
//         ));
//       } else {
//         Navigator.of(context).pop();
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text('An error occured!'),
//         ));
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('No image selected!'),
//       ));
//     }
//   }

//   // Update an existing journal
//   Future<void> _updateMenu(int id) async {
//     await FoodService.updateItem(
//         id, _nameController.text, _descriptionController.text);
//     // _refreshMenu();
//   }

//   // Delete an item
//   void _deleteItem(int id) async {
//     await FoodService.deleteItem(id);
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//       content: Text('Successfully deleted a menu!'),
//     ));
//     // _refreshMenu();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Set food product fetched from the database
//     _menus = ref.watch(foodProvider).items;
//     return Stack(
//       children: [
//         // Floating action button
//         Positioned(
//           bottom: 10,
//           right: 10,
//           child: FloatingActionButton(
//             backgroundColor: AppTheme.gray,
//             foregroundColor: AppTheme.light,
//             onPressed: (() => _showForm(null)),
//             child: const Icon(Icons.add),
//           ),
//         ),
//         SingleChildScrollView(
//           child: _menus.isNotEmpty
//               ? Padding(
//                   padding: const EdgeInsets.all(PADDING / 2),
//                   child: MasonryView(
//                     listOfItem: _menus,
//                     numberOfColumn: 2,
//                     itemPadding: PADDING / 4,
//                     itemBuilder: (item) {
//                       return FoodCard(
//                           item: item,
//                           action: () {
//                             _showForm(item.id);
//                           });
//                     },
//                   ),
//                 )
//               : Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const SizedBox(
//                         height: 100,
//                       ),
//                       const Text("You don't have any item saved"),
//                       TextButton(
//                           onPressed: (() => _showForm(null)),
//                           child: const Text(
//                             "Add menu",
//                             style: TextStyle(color: AppTheme.gold),
//                           ))
//                     ],
//                   ),
//                 ),
//         ),
//       ],
//     );
//   }
// }
