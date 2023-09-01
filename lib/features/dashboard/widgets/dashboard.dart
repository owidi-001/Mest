import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:mest/features/dashboard/cart/cart.dart';
import 'package:mest/features/dashboard/journal/journal.dart';
import 'package:mest/features/dashboard/home/home.dart';
import 'package:mest/features/dashboard/reads/reads.dart';
import 'package:mest/shared/core/provider/dashboard_provider.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';

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

  List<TabItem> tabItems = List.of([
    TabItem(CupertinoIcons.bag_fill, "Shop", AppTheme.dark,
        labelStyle: AppFont.normal),
    TabItem(CupertinoIcons.news_solid, "Reads", AppTheme.dark,
        labelStyle: AppFont.normal),
    TabItem(CupertinoIcons.cart_fill, "Cart", AppTheme.dark,
        labelStyle: AppFont.normal),
    TabItem(Icons.person, "Profile", AppTheme.dark, labelStyle: AppFont.normal),
  ]);

  Widget bottomNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: tabItems.asMap().entries.map((entry) {
        final index = entry.key;
        final tabItem = entry.value;
        return GestureDetector(
          onTap: () {
            ref.read(dashBoardNotifierProvider.notifier).setPosition(index);
          },
          child: Icon(
            tabItem.icon,
            color: ref.watch(dashBoardNotifierProvider) == index
                ? AppTheme.light
                : Colors.white.withOpacity(.5),
            size: 32,
          ),
        );
      }).toList(),
    );
  }

  @override
  void initState() {
    super.initState();
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
            borderRadius:
                isOpen ? BorderRadius.circular(10) : BorderRadius.circular(0)),
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
                    child: Container(
                        height: 60,
                        width: MediaQuery.sizeOf(context).width,
                        margin: const EdgeInsets.symmetric(horizontal: 32),
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 2.0)
                            ],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32)),
                            color: AppTheme.dark),
                        child: bottomNavigation()),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabItem {
  IconData icon;
  String title;
  Color circleColor;
  Color? circleStrokeColor;
  TextStyle labelStyle;

  TabItem(
    this.icon,
    this.title,
    this.circleColor, {
    this.circleStrokeColor,
    this.labelStyle = const TextStyle(fontWeight: FontWeight.bold),
  });
}
