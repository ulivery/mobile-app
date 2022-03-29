import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ulivery_mobile_app/pages/login/verify_email.dart';

class ShopEnvironmentsPage extends StatelessWidget {
  const ShopEnvironmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shops"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Theme.of(context).colorScheme.secondary),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
      body: ListView(children: [
        const ShopEnvironment(
            image: "https://www.vitam.nl/hubfs/Vitam_November2019%20Theme/Images/Chefs-bereiden-gerechten-vers.jpg",
            name: "Vitam - Zuyd Hogeschool Heerlen"),
        const ShopEnvironment(
            image: "https://media.prdn.nl/retailtrends/images/subway%282%29.jpg", name: "Subway - ... Heerlen"),
        ElevatedButton(
          child: const Text("View page"),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => const VerifyEmailPage()));
          },
        )
      ]),
    );
  }
}

class ShopEnvironment extends StatelessWidget {
  final String image;
  final String name;

  const ShopEnvironment({required this.image, required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          image,
          fit: BoxFit.fitWidth,
          height: 180,
        ),
      ),
      subtitle: Center(
        child: Text(name, style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.bold)),
      ),
      onTap: () {},
    );
  }
}
