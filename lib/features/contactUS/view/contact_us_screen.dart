import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/contact_us_cubit.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/core/widgets/text_form_field.dart';
import 'package:foodtracker/features/contactUS/widget/message_widget.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final cubit = ContactUsCubit();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => cubit,
  child: BlocConsumer<ContactUsCubit, ContactUsState>(
  listener: (context, state) {
    if (state is ContactUsLoading) {
      showLoading();
    }
    if (state is ContactUsSuccess) {
      hideLoading();
      showSuccess(cubit.contactUsModel.message);
    }
    if (state is ContactUsFailure) {
      hideLoading();
      showError(cubit.contactUsModel.message);
    }
  },
  builder: (context, state) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
                child: ForgetPasswordBarWidget(
                    onPressed: () => pop(context), title: "${S().contactUs}")),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.sp,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${S().contactUsTitle}",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "${S().contactUsDescription}",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.sp),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(14.sp),border: Border.all(color: Colors.black.withOpacity(0.3)),),
                child: Column(
                  children: [
                    AppTextField(
                      hint: MyShared.getString(key: MySharedKeys.name),
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      isPassword: false,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                      title: "User Name",
                    ),
                    AppTextField(
                      hint: MyShared.getString(key: MySharedKeys.email),
                      keyboardType: TextInputType.name,
                      controller: emailController,
                      isPassword: false,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                      title: "${S().email}",
                    ),
                    AppTextField(
                      hint: MyShared.getString(key: MySharedKeys.phone),
                      keyboardType: TextInputType.name,
                      controller: phoneController,
                      isPassword: false,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                      title: "${S().phoneNumber}",
                    ),
                    MessageWidget(
                      hint: "${S().yourMessageNote}",
                      keyboardType: TextInputType.text,
                      controller: messageController,
                      isPassword: false,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.text,
                      title: "${S().yourMessage}", minLine: 2, maxLine: 7,
                    ),
                  ],
                ),
              ),
            ),
        
            SizedBox(
              height: 2.h,
            ),
            AppButton(
              onPressed: () {
                cubit.userContactUs(
                    email: emailController.text,
                     name: nameController.text, phone: phoneController.text, message: messageController.text);
              },
              label: "${S().send}",
              sizeFont: 16.sp,
              borderRadius: BorderRadius.circular(12.sp),
              bgColor: AppColors.primary,
            ),
            SizedBox(
              height: 3.h,
            )
          ],
        ),
      ),
    ));
  },
),
);
  }
}
