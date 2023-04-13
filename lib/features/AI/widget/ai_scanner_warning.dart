import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AIScannerWarning extends StatelessWidget {
  const AIScannerWarning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline_outlined,color: Colors.red,),
                SizedBox(width: 1.w,),
                Text("Warning",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 17.sp),)
              ],
            ),
            SizedBox(height: 2.h,),
            Center(child: Text("This result is not 100% correct. In the event that the symptoms were very serious, you should go to the nearest doctor or hospital.",style: TextStyle(color: Colors.black,fontSize: 15.sp,),))
          ],
        ),
      ),
    );
  }
}
