import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget _getUserClip(String name) {
    String chars = "";
    for (String word in name.split(" ")) {
      chars += word.characters.first;
    }

    return ClipOval(
      child: Material(
        color: Theme.of(context).colorScheme.primary,
        child: SizedBox(
          height: 50,
          width: 50,
          child: Align(
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(chars,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimary)),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Instellingen"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                leading: _getUserClip(user.displayName!),
                title: Text(user.displayName!),
                subtitle: Text(user.email!),
                trailing: IconButton(
                  icon: Icon(Icons.logout, color: Theme.of(context).colorScheme.error),
                  tooltip: "Uitloggen",
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SettingsTile(
                    icon: Icons.color_lens,
                    title: "Thema",
                    subTitle: "N/A",
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
                if (snapshot.hasData) {
                  return Text("Ulivery | Versie ${snapshot.data!.version} (${snapshot.data!.buildNumber})");
                }

                return const Text("Ulivery");
              },
            ),
          )
        ],
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subTitle;
  final VoidCallback onPressed;

  const SettingsTile({Key? key, required this.icon, required this.title, this.subTitle, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).scaffoldBackgroundColor),
          shadowColor: MaterialStateProperty.all<Color>(Theme.of(context).scaffoldBackgroundColor),
          overlayColor: MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.2)),
          foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).textTheme.bodyText1!.color!)),
      child: ListTile(
        leading: SizedBox(
          height: double.infinity,
          child: Icon(icon, size: 30, color: Colors.orange),
        ),
        title: Text(title),
        subtitle: subTitle != null ? Text(subTitle!) : null,
        trailing: const Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
