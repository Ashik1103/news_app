import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app/DetailsPage.dart';
import 'package:news_app/firstScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FristScreen());
  }
}

class MyHomePage extends StatefulWidget {
  List? value;
  MyHomePage({Key? key, required this.value}) : super(key: key);

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(this.value);
}

class _MyHomePageState extends State<MyHomePage> {
  List? value;
  var jd;
  var res;

  // getData() async {
  //   var response = await get(Uri.parse(
  //       'https://newsdata.io/api/1/news?apikey=pub_9539cf9b1b4d6bf18cab30a55b3bd0a58ac7&language=en'));
  //   setState(() {
  //     jd = jsonDecode(response.body);
  //     res = jd['results'];
  //     // for (var i = 0; i < res.length; i++) {
  //     //   if (res[i]['description'] != null) {
  //     //     dataa = res[i];
  //     //   }
  //     // }
  //   });
  //   print(jd);
  // }

  // void initState() {
  //   super.initState();
  //   getData();
  // }

  _MyHomePageState(this.value);
  @override
  Widget build(BuildContext context) {
    print(value);

    return Scaffold(
        body: SafeArea(
      child: Container(
          width: 300,
          height: 200,
          child: ListView.builder(
              itemCount: value!.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(data: value![index]),
                        // builder: (context) => Jeni(),
                      ),
                    );
                  },
                  child: Container(
                    child: ListTile(
                      leading: SizedBox(
                          width: 100, child: Text(value![index]['title'])),
                      // leading:Text("hello there")
                    ),
                  ),
                );
              })),
    ));
  }
}
