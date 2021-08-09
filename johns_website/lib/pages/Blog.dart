import 'DefaultPage.dart';
import 'package:flutter/material.dart';
import '../components/Components.dart';

class BlogPage extends DefaultPage {
  final String? pagename;

  BlogPage({Key? key, String? this.pagename})
      : super(
          centralComponent: BlankPage(
            page: _BlogPage(pagename: pagename),
          ),
        );
}

class _BlogPage extends StatelessWidget {
  final String? pagename;

  _BlogPage({Key? key, String? this.pagename}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Text('Blog page')],
        )
      ],
    );
  }
}
