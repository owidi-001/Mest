import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mest/presentation/dashboard/journal/widgets/logout_prompt.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/utils/utils.dart';

class Journal extends StatelessWidget {
  const Journal({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: PADDING),
            child: Text("Your Profile", style: AppFont.title),
          ),
        ),
        // Profile image
        SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.symmetric(
                horizontal: PADDING, vertical: PADDING),
            child: CircleAvatar(
              radius: PADDING * 3,
              child: Image.asset(
                "assets/images/avatar.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(PADDING),
            margin: const EdgeInsets.symmetric(horizontal: PADDING),
            decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadiusDirectional.circular(PADDING)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "John Doe",
                  style: AppFont.title.copyWith(fontSize: 16),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.play_arrow_sharp))
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: PADDING),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: PADDING),
                  title: Text(
                    "Mentor request",
                    style: AppFont.title.copyWith(fontSize: 16),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.arrow_right_circle_fill,
                        color: Colors.white54,
                      )),
                ),
                const Divider(
                  height: 0,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: PADDING),
                  title: Text(
                    "Messages",
                    style: AppFont.title.copyWith(fontSize: 16),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.arrow_right_circle_fill,
                        color: Colors.white54,
                      )),
                ),
                const Divider(
                  height: 0,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: PADDING),
                  title: Text(
                    "Notifications",
                    style: AppFont.title.copyWith(fontSize: 16),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.arrow_right_circle_fill,
                        color: Colors.white54,
                      )),
                ),
                const Divider(
                  height: 0,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: PADDING),
                  title: Text(
                    "Location",
                    style: AppFont.title.copyWith(fontSize: 16),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.arrow_right_circle_fill,
                        color: Colors.white54,
                      )),
                ),
                const Divider(
                  height: 0,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: PADDING),
                  title: Text(
                    "Privacy policy",
                    style: AppFont.title.copyWith(fontSize: 16),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.arrow_right_circle_fill,
                        color: Colors.white54,
                      )),
                ),
                const Divider(
                  height: 0,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: PADDING),
                  title: Text(
                    "Location",
                    style: AppFont.title.copyWith(fontSize: 16),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.arrow_right_circle_fill,
                        color: Colors.white54,
                      )),
                ),
                const Divider(
                  height: 0,
                ),
                ListTile(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => const LogoutDialog());
                  },
                  contentPadding: const EdgeInsets.symmetric(vertical: PADDING),
                  title: Text(
                    "Log out",
                    style: AppFont.title.copyWith(fontSize: 16),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => const LogoutDialog());
                      },
                      icon: const Icon(
                        CupertinoIcons.arrow_right_circle_fill,
                        color: Colors.white54,
                      )),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}