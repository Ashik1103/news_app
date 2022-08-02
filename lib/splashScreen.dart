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
        'http://content.guardianapis.com/search?page-size=15&api-key=abc0a2ba-5a4e-471c-b74d-7419f67ca053&show-fields=webTitle,thumbnail,bodyText'));
    setState(() {
      jd = jsonDecode(response.body);
      res = jd['response']['results'];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
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
