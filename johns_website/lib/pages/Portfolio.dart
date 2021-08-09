import 'package:johns_website/components/BlankPage.dart';

import 'DefaultPage.dart';
import 'package:flutter/material.dart';
import '../components/Components.dart';

class PortfolioPage extends DefaultPage {
  final String? pagename;

  PortfolioPage({Key? key, String? this.pagename})
      : super(
          centralComponent: BlankPage(
            page: _PortfolioPage(pagename: pagename),
          ),
        );
}

class _PortfolioPage extends StatelessWidget {
  final String? pagename;

  _PortfolioPage({Key? key, String? this.pagename}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Text('Portfolio page!')],
        )
      ],
    );
  }
}
