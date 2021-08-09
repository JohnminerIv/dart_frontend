import 'package:johns_website/components/BlankPage.dart';

import 'DefaultPage.dart';
import 'package:flutter/material.dart';
import '../components/Components.dart';

class PageNotFoundPage extends DefaultPage {
  final String? pagename;

  PageNotFoundPage({Key? key, String? this.pagename})
      : super(
          centralComponent: BlankPage(
            page: _PageNotFoundPage(pagename: pagename),
          ),
        );
}

class _PageNotFoundPage extends StatelessWidget {
  final String? pagename;

  _PageNotFoundPage({Key? key, String? this.pagename}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Text('Could not find $pagename')],
        )
      ],
    );
  }
}
