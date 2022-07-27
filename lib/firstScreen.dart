import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
    
   

    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: SafeArea(
        child: Container(
          width: 420.w,
          height: 900.h,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 32.h,
                  right: 190.w,
                ),
                child: Text(
                  "Latest News",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: ListView.builder(
                    itemCount: value!.length,
                    itemBuilder: (BuildContext context, int index) {
                      
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPage(value: value![index]),
                              // builder: (context) => Jeni(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 38.h),
                          child: Container(
                            // color: Colors.pinkAccent,
                            // color: Color(0xff1C1C1C),
                            width: 100.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 16.w,
                                    // right: 16.w,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    
                                    child:
                                    value![index]['fields']['thumbnail']==null?
                                    Image.asset('assets/images/gnews.png',height: 165.h,
                                    width: 376.w,
                                    fit: BoxFit.fill,):
                                     Image.network(
                                      value![index]['fields']['thumbnail'],
                                      height: 195.h,
                                      width: 396.w,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 18.w, right: 10.w, top: 13.h),
                                  child: Text(
                                    value![index]['webTitle'],
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        letterSpacing: 1.sp,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
