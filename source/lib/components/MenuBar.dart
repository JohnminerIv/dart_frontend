import 'package:flutter/material.dart';
import '../routes.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 150),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.popUntil(context,
                          ModalRoute.withName(Navigator.defaultRouteName)),
                      child: Text(
                        "John the Fourth",
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Mono',
                            fontSize: 25),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Wrap(
                          children: <Widget>[
                            MaterialButton(
                              onPressed: () => Navigator.popUntil(
                                  context,
                                  ModalRoute.withName(
                                      Navigator.defaultRouteName)),
                              child: Text(
                                "HOME",
                                style: Theme.of(context).textTheme.button,
                              ),
                              splashColor: Colors.transparent,
                              hoverColor: Theme.of(context).accentColor,
                              highlightColor: Colors.transparent,
                              height: 45,
                            ),
                            MaterialButton(
                              onPressed: () => {
                                Navigator.pushNamed(context, Routes.portfolio)
                              },
                              child: Text(
                                "PORTFOLIO",
                                style: Theme.of(context).textTheme.button,
                              ),
                              splashColor: Colors.transparent,
                              hoverColor: Theme.of(context).accentColor,
                              highlightColor: Colors.transparent,
                              height: 45,
                            ),
                            MaterialButton(
                              onPressed: () =>
                                  {Navigator.pushNamed(context, Routes.blog)},
                              child: Text(
                                "BLOG",
                                style: Theme.of(context).textTheme.button,
                              ),
                              splashColor: Colors.transparent,
                              hoverColor: Theme.of(context).accentColor,
                              highlightColor: Colors.transparent,
                              height: 45,
                            ),
                            MaterialButton(
                              onPressed: () =>
                                  {Navigator.pushNamed(context, Routes.about)},
                              child: Text(
                                "ABOUT",
                                style: Theme.of(context).textTheme.button,
                              ),
                              splashColor: Colors.transparent,
                              hoverColor: Theme.of(context).accentColor,
                              highlightColor: Colors.transparent,
                              height: 45,
                            ),
                            MaterialButton(
                              onPressed: () => {
                                Navigator.pushNamed(context, Routes.contact)
                              },
                              child: Text(
                                "CONTACT",
                                style: Theme.of(context).textTheme.button,
                              ),
                              splashColor: Colors.transparent,
                              hoverColor: Theme.of(context).accentColor,
                              highlightColor: Colors.transparent,
                              height: 45,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 30),
        )
      ],
    );
  }
}
