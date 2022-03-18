import 'package:flutter/material.dart';

abstract class BasicPage extends StatefulWidget {
  final String title;

  const BasicPage({required this.title, Key? key}) : super(key: key);

  @override
  BasicPageState createState();
}

abstract class BasicPageState<T extends BasicPage> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context);
}

class ExamplePage extends BasicPage {
  const ExamplePage({Key? key}) : super(title: "Example", key: key);

  @override
  BasicPageState<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends BasicPageState<ExamplePage> {
  @override
  Widget buildBody(BuildContext context) {
    return Container();
  }
}
