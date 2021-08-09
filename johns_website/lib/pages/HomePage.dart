import 'package:johns_website/components/BlankPage.dart';

import 'DefaultPage.dart';
import 'package:flutter/material.dart';
import '../components/Components.dart';

class HomePage extends DefaultPage {
  HomePage()
      : super(
          centralComponent: BlankPage(
            page: _HomePage(),
          ),
        );
}

class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Text('This is the Homepage')],
        )
      ],
    );
  }
}
