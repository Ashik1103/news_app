import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  final Map value;
  const DetailsPage({Key? key, required this.value}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState(this.value);
}

class _DetailsPageState extends State<DetailsPage> {
  final Map value;
  _DetailsPageState(this.value);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color(0xff1E1E1E),

      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Stack(
              children: [
               
                value!['fields']['thumbnail']==null?
             Image.asset('assets/images/gnews.png',height: 375.h,
             width: 428.w,
             fit: BoxFit.fill,):
             Image.network(
               value['fields']['thumbnail'],
               height: 375.h,
             width: 428.w,
               fit: BoxFit.fill,
             ),
              Padding(
                padding:  EdgeInsets.only(top:32.h,left:16.w),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image.asset('assets/images/back.png')),
              ),
              ],
              
            ),

             
            Padding(
              padding:  EdgeInsets.only(top:16.h,left:16.w),
              child: Text(value['webTitle'],
              style: GoogleFonts.poppins(
                textStyle:TextStyle(
                  fontSize:20.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                )
              ),
              ),
            ),
            SizedBox(height: 16.h,),
            Expanded(
              child: Scrollbar(
                isAlwaysShown: true, //always show scrollbar
        thickness: 10, //width of scrollbar
        radius: Radius.circular(20), //corner radius of scrollbar
        scrollbarOrientation: ScrollbarOrientation.right, 
                child: SingleChildScrollView(
                  
                  child: Padding(
                    padding:  EdgeInsets.only(left:16.w,right:16.w,),
                    child: Text(
                    value['fields']['bodyText'],
                     style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      textStyle:TextStyle(
                        letterSpacing:4.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      )
                    ),
                    ),
                  ),
                ),
              ),),
            // Text(value['content'])
          ],
        ),
      )),
    );
  }
}
