import 'DefaultPage.dart';
import 'package:flutter/material.dart';
import '../components/Components.dart';

class AboutPage extends DefaultPage {
  final String? pagename;

  AboutPage({Key? key, String? this.pagename})
      : super(
          centralComponent: BlankPage(
            page: _AboutPage(pagename: pagename),
          ),
        );
}

class _AboutPage extends StatelessWidget {
  final String? pagename;

  _AboutPage({Key? key, String? this.pagename}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Text('About page')],
        )
      ],
    );
  }
}
