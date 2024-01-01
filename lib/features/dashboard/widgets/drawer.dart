import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mest/features/dashboard/settings/widgets/logout_prompt.dart';
import 'package:mest/shared/core/provider/dashboard_provider.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/shared/common/utils/utils.dart';

class DrawerWidget extends ConsumerStatefulWidget {
  const DrawerWidget({super.key});

  @override
  ConsumerState<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends ConsumerState<DrawerWidget> {
  List<String> navItems = ["Shop", "Reads", "Cart", "Journal"];
  List<IconData> navIcons = [
    CupertinoIcons.bag_fill,
    CupertinoIcons.news_solid,
    CupertinoIcons.cart_fill,
    Icons.person
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
                                        "assets/icons/logo.png"))),
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
                          style: AppFont.subtitle.copyWith(
                              color: position == index
                                  ? Colors.blue[200]
                                  : Colors.white,
                              fontSize: 16),
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
                    TextButton.icon(
                      onPressed: () {
                        showAboutDialog(
                            context: context,
                            applicationName: 'Mest Holic',
                            applicationIcon: const FlutterLogo(),
                            applicationVersion: '1.0.0',
                            children: [
                              const Text(
                                aboutBody,
                                style: AppFont.normal,
                              )
                            ]);
                      },
                      icon: const Icon(CupertinoIcons.info_circle_fill),
                      label: Text(
                        "About",
                        style: AppFont.subtitle
                            .copyWith(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.share_solid,
                      ),
                      label: Text(
                        "Share App",
                        style: AppFont.subtitle
                            .copyWith(color: Colors.white, fontSize: 16),
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
                    TextButton.icon(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => const LogoutDialog());
                      },
                      icon: const Icon(Icons.logout_rounded),
                      label: Text(
                        "Logout",
                        style: AppFont.subtitle
                            .copyWith(fontSize: 16, color: Colors.white),
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

const aboutBody =
    """Welcome to our Mest application! Our app is the perfect place for book lovers and avid readers to discover and purchase their favorite titles.

With our easy-to-use interface, users can easily browse through thousands of books from various genres and authors, including bestsellers, classic literature, and niche topics. Our app also offers personalized recommendations based on users' reading history and preferences, ensuring that they never run out of new and exciting books to read.

Our app provides a seamless purchasing experience, allowing users to securely purchase their books with just a few taps. Users can choose from a variety of payment options and track their shipments in real-time, ensuring that they receive their books on time and in perfect condition.

In addition to purchasing books, our app offers a range of additional features to enhance the reading experience. Users can create reading lists, leave reviews and ratings for books, and engage with other members of the reading community through our discussion forums.

Our book selling mobile application is the ultimate destination for book lovers, offering a wide selection of books and an engaging reading community all in one convenient location. Download our app today and start exploring the wonderful world of literature!""";
