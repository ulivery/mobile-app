import 'package:flutter/material.dart';

class ShopEnvironmentsPage extends StatelessWidget {
  const ShopEnvironmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shops"),
      ),
      body: ListView(children: const [
        ShopEnvironment(
            image: "https://www.vitam.nl/hubfs/Vitam_November2019%20Theme/Images/Chefs-bereiden-gerechten-vers.jpg",
            name: "Vitam - Zuyd Hogeschool Heerlen"),
        ShopEnvironment(
            image: "https://media.prdn.nl/retailtrends/assets/subway%282%29.jpg?w=768", name: "Subway - ... Heerlen")
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
