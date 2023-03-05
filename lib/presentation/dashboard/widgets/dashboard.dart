import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:mest/presentation/dashboard/cart/cart.dart';
import 'package:mest/presentation/dashboard/journal/journal.dart';
import 'package:mest/presentation/dashboard/home/home.dart';
import 'package:mest/presentation/dashboard/reads/reads.dart';
import 'package:mest/core/provider/dashboard_provider.dart';
import 'package:mest/common/theme/font.dart';
import 'package:mest/common/theme/theme.dart';

class BaseScaffold extends ConsumerStatefulWidget {
  const BaseScaffold({super.key});

  @override
  ConsumerState<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends ConsumerState<BaseScaffold>
    with TickerProviderStateMixin {
  double xoffSet = 150;
  double yoffSet = 80;
  double angle = -0.2;

  List<Widget> screens = [
    const HomeScreen(),
    const Reads(), // Change to books read and saved screens
    const CartScreen(), // Cart
    const Journal() // Statistics : Books read, saved, bought, read time, target and profile details
  ];

  late CircularBottomNavigationController _navigationController;

  List<TabItem> tabItems = List.of([
    TabItem(CupertinoIcons.bag_fill, "Shop", AppTheme.dark,
        labelStyle: AppFont.normal),
    TabItem(CupertinoIcons.news_solid, "Reads", AppTheme.dark,
        labelStyle: AppFont.normal),
    TabItem(CupertinoIcons.cart_fill, "Cart", AppTheme.dark,
        labelStyle: AppFont.normal),
    TabItem(Icons.person, "Profile", AppTheme.dark, labelStyle: AppFont.normal),
  ]);

  Widget bottomNav() {
    return CircularBottomNavigation(tabItems,
        selectedPos: 0,
        normalIconColor: AppTheme.dark,
        selectedIconColor: AppTheme.light,
        circleStrokeWidth: 0,
        controller: _navigationController,
        barHeight: 50,
        circleSize: 50,
        iconsSize: 24,
        barBackgroundColor: Colors.blueGrey,
        animationDuration: const Duration(milliseconds: 300),
        selectedCallback: (selectedPos) => {
              ref
                  .read(dashBoardNotifierProvider.notifier)
                  .setPosition(selectedPos!)
            });
  }

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(0);
  }

  @override
  Widget build(BuildContext context) {
    var position = ref.watch(dashBoardNotifierProvider);

    var isOpen = ref.watch(drawerNotifierProvider);

    return AnimatedContainer(
        transform: Matrix4Transform()
            .translate(x: isOpen ? xoffSet : 0, y: isOpen ? yoffSet : 0)
            .rotate(isOpen ? angle : 0)
            .matrix4,
        duration: const Duration(milliseconds: 250),
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: isOpen
                    ? BorderRadius.circular(10)
                    : BorderRadius.circular(0)),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                      icon: Icon(
                        !isOpen ? Icons.menu : Icons.arrow_back_ios,
                        color: AppTheme.dark,
                      ),
                      onPressed: () {
                        ref.read(drawerNotifierProvider.notifier).toggle();
                      }),
                ),
                body: Stack(
                  children: [
                    GestureDetector(
                        onHorizontalDragStart: (details) {
                          if (isOpen) {
                            ref.read(drawerNotifierProvider.notifier).toggle();
                          }
                        },
                        child: screens[position]),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: bottomNav(),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
