import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:mest/database/helper.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/widgets/form_field.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // All menu
  List<Map<String, dynamic>> _menus = [
    {
      "name": "Chicken",
      "description": "The quick brown fox",
      "image": 'assets/images/1.png',
    },
    {
      "name": "Chicken",
      "description": "The quick brown fox",
      "image": 'assets/images/2.png',
    },
    {
      "name": "Chicken",
      "description": "The quick brown fox",
      "image": 'assets/images/3.png',
    },
    {
      "name": "Chicken",
      "description": "The quick brown fox",
      "image": 'assets/images/4.png',
    },
    {
      "name": "Chicken",
      "description": "The quick brown fox",
      "image": 'assets/images/5.png',
    },
    {
      "name": "Chicken",
      "description": "The quick brown fox",
      "image": 'assets/images/6.png',
    },
    {
      "name": "Chicken",
      "description": "The quick brown fox",
      "image": 'assets/images/7.png',
    },
    {
      "name": "Chicken",
      "description": "The quick brown fox",
      "image": 'assets/images/8.png',
    },
    {
      "name": "Chicken",
      "description": "The quick brown fox",
      "image": 'assets/images/9.png',
    },
    {
      "name": "Chicken",
      "description": "The quick brown fox",
      "image": 'assets/images/10.png',
    }
  ];

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
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingMenu = _menus.firstWhere((element) => element['id'] == id);
      _nameController.text = existingMenu['name'];
      _imageController.text = existingMenu['image'];
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
                  color: AppTheme.whiteColor,
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
                            color: AppTheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextButton.icon(
                        onPressed: () {
                          //     pickImage(ImageSource.camera);
                          //     Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.photo,
                          color: AppTheme.primary,
                        ),
                        label: const Text(
                          "Camera",
                          style: TextStyle(color: AppTheme.primary),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          //     pickImage(ImageSource.gallery);
                          //     Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.photo,
                          color: AppTheme.primary,
                        ),
                        label: const Text(
                          "Gallery",
                          style: TextStyle(color: AppTheme.primary),
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
              color: AppTheme.primary,
              child: MaterialButton(
                onPressed: () async{
                  // Save new journal
                if (id == null) {
                  await _addMenu();
                }

                if (id != null) {
                  await _updateMenu(id);
                }

                // Clear the text fields
                _nameController.text = '';
                _imageController.text = '';
                _descriptionController.text = '';

                // Close the bottom sheet
                Navigator.of(context).pop();
                },
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                minWidth: double.infinity,
                child: Text(
                  id == null ? 'Create New' : 'Update',
                  style: const TextStyle(
                      color: AppTheme.whiteColor,
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
    await SQLHelper.createItem(_nameController.text, _imageController.text,
        _descriptionController.text);
    _refreshMenu();
  }

  // Update an existing journal
  Future<void> _updateMenu(int id) async {
    await SQLHelper.updateItem(id, _nameController.text, _imageController.text,
        _descriptionController.text);
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
    final _items = [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
      'assets/images/4.png',
      'assets/images/5.png',
      'assets/images/6.png',
      'assets/images/7.png',
      'assets/images/8.png',
      'assets/images/9.png',
      'assets/images/10.png'
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        // leading: ,
        title: const Text("Menu"),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: (() {
                _showForm(null);
              }),
              child: const Icon(CupertinoIcons.add_circled_solid)),
          const SizedBox(
            width: 18,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: MasonryView(
          listOfItem: _items,
          numberOfColumn: 1,
          itemBuilder: (item) {
            return Container(
              decoration: const BoxDecoration(
                color: AppTheme.gradient,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(item),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    child: Text(
                      "Chicken",
                      style: TextStyle(
                          color: AppTheme.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      right: 10,
                      child: CircleAvatar(
                        backgroundColor: AppTheme.primary,
                        child: InkWell(
                          onTap: (() {
                            _showForm(1);
                          }),
                          child: const Icon(
                            Icons.edit,
                            color: AppTheme.whiteColor,
                          ),
                        ),
                      ))
                ],
              ),
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton.small(
      //   onPressed: () => {},
      //   backgroundColor: AppTheme.primary,
      //   foregroundColor: AppTheme.whiteColor,
      //   child: const Icon(CupertinoIcons.add_circled_solid),
      // ),
    );
  }
}
