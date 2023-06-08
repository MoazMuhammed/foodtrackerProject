import 'package:flutter/material.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/text_form_field.dart';
import 'package:foodtracker/features/AI/ai/check%20data/view/check_data_result.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DialogCheckDataWidget extends StatefulWidget {
  const DialogCheckDataWidget({Key? key}) : super(key: key);

  @override
  State<DialogCheckDataWidget> createState() => _DialogCheckDataWidgetState();
}

class _DialogCheckDataWidgetState extends State<DialogCheckDataWidget> {
  final TextEditingController inputController = TextEditingController();
  late int getValue ;
  @override
  Widget build(BuildContext context) {
    return AlertDialog( // <-- SEE HERE
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.sp))),
      contentPadding:  EdgeInsets.only(top: 10.sp),
      content: Container(
        padding: EdgeInsets.all(17.sp),
        height: 55.sp,
        child: Column(
          children: [
            AppTextField(hint: '${S().iGENumber}', keyboardType: TextInputType.text, controller: inputController, isPassword: false, textInputAction: TextInputAction.done, textInputType: TextInputType.text),
            SizedBox(height: 1.h,),
            AppButton(onPressed: () {
              getValue = int.parse(inputController.text) ;
              MyShared.putInt(key: MySharedKeys.iGE, value: getValue);
              push(context,CheckDataResult());
            }, label: "${S().startNow}", sizeFont: 15.sp,borderRadius: BorderRadius.circular(14.sp),)
          ],
        ),
      ),
    );
  }
}
