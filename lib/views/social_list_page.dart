import 'package:flutter/material.dart';

class SocialListPage extends StatefulWidget {
  const SocialListPage({Key? key}) : super(key: key);

  @override
  _SocialListPageState createState() => _SocialListPageState();
}

class _SocialListPageState extends State<SocialListPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(("Social List Page"))
        ],
      ),
    );
  }
}
