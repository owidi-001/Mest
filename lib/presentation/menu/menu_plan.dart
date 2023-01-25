import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mest/database/helper.dart';
import 'package:mest/models/food.model.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/widgets/form_field.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // All menu
  List<Map<String, dynamic>> _menus = [];

  bool _isLoading = true;

  // This function is used to fetch all data from the database
  void _refreshMenu() async {
    final data = await SQLHelper.getMenu();

    setState(() {
      _menus = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshMenu(); // loads menu when app starts
  }

  // Form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? image;

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingMenu = _menus.firstWhere((element) => element['id'] == id);
      _nameController.text = existingMenu['name'];
      _descriptionController.text = existingMenu['description'];
    }

    // show modalsheet
    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          // this will prevent the soft keyboard from covering the text fields
          bottom: MediaQuery.of(context).viewInsets.bottom + 120,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _nameController,
              decoration: buildInputDecoration("Name", Icons.food_bank),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _descriptionController,
              decoration: buildInputDecoration("Description", Icons.food_bank),
            ),

            // Test loader
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: const BoxDecoration(
                  color: AppTheme.light,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Pick Image from",
                        style: TextStyle(
                            color: AppTheme.gold,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.info,
                        color: AppTheme.gold,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Take Square photos [1:1]',
                        style: TextStyle(
                            color: AppTheme.gray,
                            fontWeight: FontWeight.normal,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextButton.icon(
                        onPressed: () async {
                          // Pick an image
                          image = await _picker.pickImage(
                              source: ImageSource.camera,
                              // Compress image upload
                              maxHeight: 1024,
                              maxWidth: 1024,
                              imageQuality: 50);
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.photo,
                          color: AppTheme.gold,
                        ),
                        label: const Text(
                          "Camera",
                          style: TextStyle(color: AppTheme.gold),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          image = await _picker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.photo,
                          color: AppTheme.gold,
                        ),
                        label: const Text(
                          "Gallery",
                          style: TextStyle(color: AppTheme.gold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Material(
              elevation: 5,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: AppTheme.gold,
              child: MaterialButton(
                onPressed: () async {
                  // Save new journal
                  if (id == null) {
                    await _addMenu();
                  }

                  if (id != null) {
                    await _updateMenu(id);
                  }

                  // Clear the text fields
                  _nameController.text = '';
                  _descriptionController.text = '';

                  // Close the bottom sheet
                  Navigator.of(context).pop();
                },
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                minWidth: double.infinity,
                child: Text(
                  id == null ? 'Create New' : 'Update',
                  style: const TextStyle(
                      color: AppTheme.light,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Insert a new journal to the database
  Future<void> _addMenu() async {
    if (image != null) {
      // convert image to base64
      String imageData = "";

      File imagefile = File(image!.path); //convert Path to File
      Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
      imageData = base64.encode(imagebytes); //convert bytes to base64 string

      if (kDebugMode) {
        print("The picked image is");
        print(imageData);
      }

      await SQLHelper.createItem(
          _nameController.text, imageData, _descriptionController.text);
      _refreshMenu();

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Menu added successfully!'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('No image selected!'),
      ));
    }
  }

  // Update an existing journal
  Future<void> _updateMenu(int id) async {
    await SQLHelper.updateItem(
        id, _nameController.text, _descriptionController.text);
    _refreshMenu();
  }

  // Delete an item
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a menu!'),
    ));
    _refreshMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.gold,
        // leading: ,
        title: const Text("Menu"),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: (() {
                _showForm(null);
              }),
              child: const CircleAvatar(
                  backgroundColor: AppTheme.gold,
                  child: Icon(CupertinoIcons.add_circled_solid))),
          const SizedBox(
            width: 18,
          )
        ],
      ),

      body: SingleChildScrollView(
        child: _menus.isNotEmpty
            ? MasonryView(
                listOfItem: _menus,
                numberOfColumn: 1,
                itemBuilder: (item) {
                  // Create food instance from the item indexed

                  Food food = Food.fromMap(item);

                  return Container(
                    decoration: const BoxDecoration(
                      color: AppTheme.gold,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        _showForm(food.id);
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: food.image.toString().isNotEmpty
                                ? Image.memory(
                                    const Base64Decoder().convert(food.image),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        color: AppTheme.gold,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 10.0),
                            child: Text(
                              food.name,
                              style: const TextStyle(
                                  color: AppTheme.gold,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: CircleAvatar(
                              backgroundColor: AppTheme.red,
                              child: InkWell(
                                onTap: (() async {
                                  await SQLHelper.deleteItem(food.id);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('Menu removed!'),
                                  ));
                                  _refreshMenu();
                                }),
                                child: const Icon(
                                  Icons.delete,
                                  color: AppTheme.light,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Text("You don't have any item saved"),
                    TextButton(
                        onPressed: (() => _showForm(null)),
                        child: const Text("Add menu"))
                  ],
                ),
              ),
      ),

      // floatingActionButton: FloatingActionButton.small(
      //   onPressed: () => {},
      //   backgroundColor: AppTheme.gold,
      //   foregroundColor: AppTheme.light,
      //   child: const Icon(CupertinoIcons.add_circled_solid),
      // ),
    );
  }
}
