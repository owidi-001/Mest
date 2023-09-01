import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class Journal extends StatelessWidget {
  const Journal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SettingsList(
          sections: [
            SettingsSection(
              title: Text('Common'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.language),
                  title: Text('Language'),
                  value: Text('English'),
                ),
                SettingsTile.switchTile(
                  onToggle: (value) {},
                  initialValue: true,
                  leading: Icon(Icons.format_paint),
                  title: Text('Enable custom theme'),
                ),
                SettingsTile.switchTile(
                  onToggle: (value) {},
                  initialValue: true,
                  leading: Icon(Icons.format_paint),
                  title: Text('Enable custom theme'),
                ),
              ],
            ),
            SettingsSection(
              title: Text('Account'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.phone),
                  title: Text('Phone number'),
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.email),
                  title: Text('Phone number'),
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.logout),
                  title: Text('Sign out'),
                ),
              ],
            ),
            SettingsSection(
              title: Text('Security'),
              tiles: <SettingsTile>[
                SettingsTile.switchTile(
                  leading: Icon(Icons.phonelink_lock_sharp),
                  title: Text('Lock phone in background'),
                  initialValue: true,
                  onToggle: (bool value) {},
                ),
              ],
            ),
          ],
        ));
  }
}
