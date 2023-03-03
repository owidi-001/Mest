import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mest/provider/dashboard_provider.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/utils/utils.dart';

class DrawerWidget extends ConsumerStatefulWidget {
  const DrawerWidget({super.key});

  @override
  ConsumerState<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends ConsumerState<DrawerWidget> {
  List<String> navItems = ["Home", "Cart", "Journal"];
  List<IconData> navIcons = [
    Icons.home,
    Icons.shopping_bag_rounded,
    Icons.stacked_line_chart_rounded
  ];

  @override
  Widget build(BuildContext context) {
    var position = ref.watch(dashBoardNotifierProvider);
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: AppTheme.dark),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.width / 4,
                            margin: const EdgeInsets.only(bottom: PADDING),
                            decoration: BoxDecoration(
                                color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width / 4),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/icons/Mest Logo.png"))),
                          ),
                          Row(
                            children: [
                              const Text(
                                "MEST",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: PADDING / 2,
                              ),
                              Text(
                                "HOLIC",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.blue[200],
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                      navItems.length,
                      (index) => TextButton.icon(
                        onPressed: () {
                          // Update selected
                          ref
                              .read(dashBoardNotifierProvider.notifier)
                              .setPosition(index);
                          // Update close drawer
                          ref.read(drawerNotifierProvider.notifier).toggle();
                        },
                        icon: Icon(
                          navIcons[index],
                          color: position == index
                              ? Colors.blue[200]
                              : Colors.white,
                        ),
                        label: Text(
                          navItems[index],
                          style: TextStyle(
                            color: position == index
                                ? Colors.blue[200]
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.blueGrey,
                      thickness: 2,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    const Text(
                      "About",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    const Text(
                      "Share App",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    const Divider(
                      color: Colors.blueGrey,
                      thickness: 2,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    const Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
