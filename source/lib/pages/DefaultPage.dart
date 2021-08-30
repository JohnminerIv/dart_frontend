import 'package:flutter/material.dart';
import '../components/Components.dart';

class DefaultPage extends StatefulWidget {
  DefaultPage({Key? key, required Widget this.centralComponent})
      : super(key: key);
  final Widget centralComponent;
  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              MenuBar(),
              widget.centralComponent,
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
