import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AIScannerDetails extends StatelessWidget {
  const AIScannerDetails({Key? key, required this.title, required this.details}) : super(key: key);
final String title;
final String details;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 17.sp),),
        SizedBox(width: 2.w,),
        Expanded(child: Text(details ,style: TextStyle(color: Colors.black,fontSize: 16.sp),maxLines: 2)),
      ],
    );
  }
}
