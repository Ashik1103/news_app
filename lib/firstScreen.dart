import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:news_app/DetailsPage.dart';

class FirstScreen extends StatefulWidget {
  List? value;
  FirstScreen({Key? key, required this.value}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState(this.value);
}

class _FirstScreenState extends State<FirstScreen> {
  List? value;
  String dropdownvalue="All";

   var topic =['All','Sports','Political'];
   
   var jd, res;
  getData() async {
    var response = await get(Uri.parse(
        'http://content.guardianapis.com/search?q=$dropdownvalue&-size=15&api-key=abc0a2ba-5a4e-471c-b74d-7419f67ca053&show-fields=webTitle,thumbnail,bodyText'));
    setState(() {
      jd = jsonDecode(response.body);
      res = jd['response']['results'];
    });
  }

  

  _FirstScreenState(this.value);
  @override
  Widget build(BuildContext context) {
    setState(() {
      getData();
    });
   

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
                  left:20.w
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dropdownvalue,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    DropdownButton(
                     
                       icon: Icon(Icons.filter_1_outlined),
                      items: topic.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
                onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                  // print(dropdownvalue);
                  getData();
                });
                },
                
                )
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: ListView.builder(
                    itemCount: res!.length,
                    itemBuilder: (BuildContext context, int index) {
                      
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPage(value: res![index]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 38.h),
                          child: Container(
                            width: 100.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 16.w,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    
                                    child:
                                    res![index]['fields']['thumbnail']==null?
                                    Image.asset('assets/images/gnews.png',height: 165.h,
                                    width: 376.w,
                                    fit: BoxFit.fill,):
                                     Image.network(
                                      res![index]['fields']['thumbnail'],
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
                                    res![index]['webTitle'],
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
