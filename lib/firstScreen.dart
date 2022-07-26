import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/DetailsPage.dart';

class FirstScreen extends StatefulWidget {
  List? value;
  FirstScreen({Key? key, required this.value}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState(this.value);
}

class _FirstScreenState extends State<FirstScreen> {
  List? value;

  _FirstScreenState(this.value);
  @override
  Widget build(BuildContext context) {
    print(value);

    return Scaffold(
        body: SafeArea(
      child: Container(
          width: 420.w,
          height: 900.h,
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
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 38.h),
                    child: SizedBox(
                      width: 100.w, child: Text(value![index]['title']),
                      // leading:Text("hello there")
                    ),
                  ),
                );
              })),
    ));
  }
}
