import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
        ),
        Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                child: Column(children: [
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: 25),
                          child: Text(
                              'Copyright © www.john-the-fourth.engineer 2021'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          alignment: Alignment.center,
                          child: Wrap(
                            children: <Widget>[
                              MaterialButton(
                                onPressed: () => {
                                  launch(
                                      'https://www.facebook.com/john.miner.9693/')
                                },
                                child: Image.network(
                                  'assets/images/facebook.png',
                                  scale: 3,
                                ),
                              ),
                              MaterialButton(
                                onPressed: () => {
                                  launch(
                                      'https://www.linkedin.com/in/john-miner-61b95618a/')
                                },
                                child: Image.network(
                                  'assets/images/in.png',
                                  scale: 3,
                                ),
                              ),
                              MaterialButton(
                                onPressed: () =>
                                    {launch('https://github.com/JohnminerIv')},
                                child: Image.network(
                                  'assets/images/github.png',
                                  scale: 3,
                                ),
                              ),
                              MaterialButton(
                                onPressed: () =>
                                    {launch('https://discord.gg/g596CtKd6c')},
                                child: Image.network(
                                  'assets/images/discord.png',
                                  scale: 3,
                                ),
                              ),
                              MaterialButton(
                                onPressed: () => {
                                  launch(
                                      'https://john-douglas-miner-iv.medium.com/')
                                },
                                child: Image.network(
                                  'assets/images/medium.png',
                                  scale: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
              )
            ],
          ),
        ),
      ],
    );
  }
}
