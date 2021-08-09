import 'DefaultPage.dart';
import 'package:flutter/material.dart';
import '../components/Components.dart';

class ContactPage extends DefaultPage {
  final String? pagename;

  ContactPage({Key? key, String? this.pagename})
      : super(
          centralComponent: BlankPage(
            page: _ContactPage(pagename: pagename),
          ),
        );
}

class _ContactPage extends StatelessWidget {
  final String? pagename;

  _ContactPage({Key? key, String? this.pagename}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Text('Contact page')],
        )
      ],
    );
  }
}
