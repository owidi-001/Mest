import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:mest/features/dashboard/cart/cart.dart';
import 'package:mest/features/dashboard/journal/journal.dart';
import 'package:mest/features/dashboard/home/home.dart';
import 'package:mest/features/dashboard/reads/reads.dart';
import 'package:mest/shared/common/utils/utils.dart';
import 'package:mest/shared/core/provider/dashboard_provider.dart';
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

  List<IconData> tabItems = List.of([
    Icons.dashboard_rounded,
    CupertinoIcons.news_solid,
    FontAwesomeIcons.bagShopping,
    FontAwesomeIcons.sliders
  ]);

  Widget bottomNavigation() {
    final int currentPosition = ref.watch(dashBoardNotifierProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: tabItems.asMap().entries.map((entry) {
        final int index = entry.key;
        final IconData tabItem = entry.value;
        final bool isSelected = currentPosition == index;

        return GestureDetector(
          onTap: () {
            ref.read(dashBoardNotifierProvider.notifier).setPosition(index);
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: const Cubic(0.27, 1.21, .77, 1.09),
            switchOutCurve: const Cubic(0.27, 1.21, .77, 1.09),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: Column(
              children: [
                Expanded(
                  child: Icon(
                    tabItem,
                    color: isSelected
                        ? AppTheme.light
                        : Colors.white.withOpacity(0.5),
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
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
                  icon: FaIcon(
                    !isOpen
                        ? FontAwesomeIcons.barsStaggered
                        : FontAwesomeIcons.xmark,
                    color: AppTheme.dark,
                  ),
                  onPressed: () {
                    ref.read(drawerNotifierProvider.notifier).toggle();
                  }),
              actions: [
                CircleAvatar(
                  backgroundColor: AppTheme.dark,
                  child: ClipOval(
                    child: Image.asset(
                      "assets/icons/logo.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  width: PADDING,
                )
              ],
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
                  bottom: 8,
                  right: 0,
                  left: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        height: 50,
                        width: MediaQuery.sizeOf(context).width,
                        margin: const EdgeInsets.symmetric(horizontal: 32),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            color: AppTheme.gray),
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
