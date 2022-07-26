import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final Map data;
  const DetailsPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState(this.data);
}

class _DetailsPageState extends State<DetailsPage> {
  final Map data;
  _DetailsPageState(this.data);
  @override
  Widget build(BuildContext context) {
    print(data['title']);
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Text(data['title']),
            Text(data['description']),
            Text(data['content'])
          ],
        ),
      )),
    );
  }
}
