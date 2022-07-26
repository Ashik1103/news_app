import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'package:news_app/firstScreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  var jd, res;
  getData() async {
    var response = await get(Uri.parse(
        'https://newsapi.org/v2/everything?q=Apple&from=2022-07-24&sortBy=popularity&apiKey=093b0704ae6843c6ba8350df4ba0031e'));
    setState(() {
      jd = jsonDecode(response.body);
      res = jd['articles'];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FirstScreen(value: res),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: SafeArea(
          child: Center(
              child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon(Icons.newspaper_sharp,color: Colors.white,size: 40.sp,),
          Container(
              width: 51.w,
              height: 41.h,
              child: Image.asset('assets/images/news.png')),
          SizedBox(width: 12.w),
          Text('GNEWS',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 48.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              )),
        ],
      ))),
    );
  }
}
