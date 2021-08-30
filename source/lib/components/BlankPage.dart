import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  BlankPage({Key? key, Widget? this.page}) : super(key: key);
  final Widget? page;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    Widget actualPage = page ??
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [Text('Something went wrong...')],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 100),
            )
          ],
        );
    if (screenSize.width <= 1000) {
      return Container(
        color: Theme.of(context).backgroundColor,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: actualPage,
      );
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 150),
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: actualPage,
    );
  }
}
