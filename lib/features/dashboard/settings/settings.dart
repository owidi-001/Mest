import 'package:flutter/material.dart';
import 'package:mest/features/dashboard/settings/components/library/library.dart';
import 'package:mest/shared/common/utils/utils.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Rounded and centered profile picture
                const CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                const SizedBox(height: 16.0),
                // Username
                Text(
                  'John Doe',
                  style: AppFont.title.copyWith(fontSize: PADDING),
                ),
                const SizedBox(height: 8.0),
                // Row of statistical numbers and labels
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStatisticTile(
                      number: 18,
                      label: 'Books',
                    ),
                    _buildStatisticTile(
                      number: 6,
                      label: 'Authors',
                    ),
                    _buildStatisticTile(
                      number: 5,
                      label: 'Genres',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // List of settings tiles with leading icons and labels
        SliverFillRemaining(
          child: Container(
            decoration: const BoxDecoration(
                color: AppTheme.light,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(PADDING),
                    topRight: Radius.circular(PADDING))),
            child: ListView(children: [
              ListTile(
                leading: const Icon(Icons.book),
                title: const Text('My Library'),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const Library()));
                },
              ),
              const ListTile(
                leading: Icon(Icons.percent),
                title: Text('Discounts'),
              ),
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              const ListTile(
                leading: Icon(Icons.description),
                title: Text('Terms and Conditions'),
              ),
              const ListTile(
                leading: Icon(Icons.help),
                title: Text('Help'),
              ),
              const ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
              ),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildStatisticTile({required int number, required String label}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Text(
              '$number',
              style: AppFont.subtitle
                  .copyWith(color: AppTheme.dark, fontSize: PADDING),
            ),
            Text(
              label,
              style: AppFont.subtitle
                  .copyWith(color: const Color.fromARGB(255, 53, 59, 67)),
            ),
          ],
        ),
      ),
    );
  }
}
