import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mest/presentation/dashboard/journal/widgets/logout_prompt.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/utils/utils.dart';

class Journal extends StatelessWidget {
  const Journal({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: PADDING * 2),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("Your Profile", style: AppFont.title),
        // Profile image
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.symmetric(vertical: PADDING),
          child: CircleAvatar(
            radius: PADDING * 3,
            child: Image.asset(
              "assets/images/avatar.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(PADDING),
          decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadiusDirectional.circular(PADDING / 2)),
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
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: PADDING),
          title: Text(
            "Mentor request",
            style: AppFont.title.copyWith(fontSize: 16, color: Colors.blueGrey),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.arrow_right_circle_fill,
                color: AppTheme.dark,
              )),
        ),
        const Divider(
          height: 0,
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: PADDING),
          title: Text(
            "Messages",
            style: AppFont.title.copyWith(fontSize: 16, color: Colors.blueGrey),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.arrow_right_circle_fill,
                color: AppTheme.dark,
              )),
        ),
        const Divider(
          height: 0,
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: PADDING),
          title: Text(
            "Notifications",
            style: AppFont.title.copyWith(fontSize: 16, color: Colors.blueGrey),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.arrow_right_circle_fill,
                color: AppTheme.dark,
              )),
        ),
        const Divider(
          height: 0,
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: PADDING),
          title: Text(
            "Location",
            style: AppFont.title.copyWith(fontSize: 16, color: Colors.blueGrey),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.arrow_right_circle_fill,
                color: AppTheme.dark,
              )),
        ),
        const Divider(
          height: 0,
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: PADDING),
          title: Text(
            "Privacy policy",
            style: AppFont.title.copyWith(fontSize: 16, color: Colors.blueGrey),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.arrow_right_circle_fill,
                color: AppTheme.dark,
              )),
        ),
        const Divider(
          height: 0,
        ),
        ListTile(
          onTap: () {
            showDialog(
                context: context, builder: (context) => const LogoutDialog());
          },
          contentPadding: const EdgeInsets.symmetric(vertical: PADDING),
          title: Text(
            "Log out",
            style: AppFont.title.copyWith(fontSize: 16, color: Colors.blueGrey),
          ),
          trailing: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => const LogoutDialog());
              },
              icon: const Icon(
                CupertinoIcons.arrow_right_circle_fill,
                color: AppTheme.dark,
              )),
        ),
        const SizedBox(
          height: 50,
        )
      ]),
    );
  }
}
