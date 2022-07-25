

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app/main.dart';
import 'package:flutter/widgets.dart';

class FristScreen extends StatefulWidget {
  const FristScreen({Key? key}) : super(key: key);

  @override
  State<FristScreen> createState() => _FristScreenState();
}

class _FristScreenState extends State<FristScreen> {
  var jd,res;
  getData() async {
    var response = await get(Uri.parse(
        'https://newsdata.io/api/1/news?apikey=pub_9539cf9b1b4d6bf18cab30a55b3bd0a58ac7&language=en'));
    setState(() {
      jd = jsonDecode(response.body);
      res = jd['results'];
      // for (var i = 0; i < res.length; i++) {
      //   if (res[i]['description'] != null) {
      //     dataa = res[i];
      //   }
      // }
    });
    print(jd);
  }

  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(child: Column(
         children: [
           ElevatedButton(onPressed: (){
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder: (context) => MyHomePage(value: res),
                       // builder: (context) => Jeni(),
                     ),
                   );
                 }, child: const Text("Elevated Button"))
           // Text("Check the latest news"),
         ],
       )),
    );
  }
}