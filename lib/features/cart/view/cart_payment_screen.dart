import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/product/paymentCart/payment_cart_cubit.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/core/widgets/text_form_field.dart';
import 'package:foodtracker/features/cart/widget/congratolation_cart_screen.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentCartScreen extends StatefulWidget {
  PaymentCartScreen({Key? key, required this.totalPrice}) : super(key: key);
  final String totalPrice;

  @override
  State<PaymentCartScreen> createState() => _PaymentCartScreenState();
}

class _PaymentCartScreenState extends State<PaymentCartScreen> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController addressEditingController = TextEditingController();
  TextEditingController timeEditingController = TextEditingController();
  final cubit = PaymentCartCubit();
  late DateTime time;
  DateTime? threeDaysLater;

  @override
  void initState() {
    time = new DateTime.now();
    threeDaysLater = time.add(Duration(days: 3));
    timeEditingController.text == threeDaysLater;
    addressEditingController.text == null? "": "${placeMark?[0].street.toString()}" +
    "-" +
        "${placeMark?[0].country.toString()}";
    super.initState();
  }

  Position? position;
  List<Placemark>? placeMark;

  void _determinePosition() async {
    bool serviceEnable;
    LocationPermission permission;

    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error("Location services are disable");
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      openAppSettings();
      if (permission == LocationPermission.denied) {
        openAppSettings();
      }
    }
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    placeMark =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);

    safePrint(placeMark);

    safePrint(position);

    addressEditingController.text = "${placeMark?[0].street.toString()}" +
        "-" +
        "${placeMark?[0].country.toString()}";
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<PaymentCartCubit, PaymentCartState>(
        listener: (context, state) {
          if (state is PaymentCartLoading) {
            showLoading();
          }
          if (state is PaymentCartSuccess) {
            hideLoading();
          }
          if (state is PaymentCartFailure) {
            hideLoading();
            showError("Error");
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: SafeArea(
                child: Scaffold(
              body: Column(
                children: [
                  ForgetPasswordBarWidget(
                      onPressed: () => pop(context),
                      title: "${S().paymentMethod}"),
                  Expanded(
                    child: Column(
                      children: [
                        AppTextField(
                          hint: MyShared.getString(key: MySharedKeys.name),
                          keyboardType: TextInputType.name,
                          controller: nameEditingController,
                          isPassword: false,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.name,
                          title: "${S().ownerName}",
                        ),
                        AppTextField(
                          hint: MyShared.getString(key: MySharedKeys.phone),
                          keyboardType: TextInputType.number,
                          controller: phoneEditingController,
                          isPassword: false,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.name,
                          title: "${S().ownerTelephone}",
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: AppTextField(
                                hint: placeMark != null
                                    ? "${placeMark?[0].street.toString()}" +
                                        "-" +
                                        "${placeMark?[0].country.toString()}"
                                    : "Enter Your Location",
                                controller: addressEditingController,
                                isPassword: false,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.streetAddress,
                                title: "${S().addressOfShipment}",
                                keyboardType: TextInputType.streetAddress,
                                validators: (value) {
                                  if (value.isEmpty) {
                                    return 'Address is required';
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      _determinePosition();
                                    });
                                  },
                                  icon: Icon(Icons.location_on_rounded)),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.sp, vertical: 4.sp),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "${S().dateOfShipment}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.sp, vertical: 12.sp),
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 2.sp)),
                                      child: Text("${time.day}" +
                                          "-" +
                                          "${time.month}" +
                                          "-" +
                                          "${time.year}")),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text("${S().dateOfDelivery}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.sp, vertical: 12.sp),
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 2.sp)),
                                      child: Text("${threeDaysLater!.day}" +
                                          "-" +
                                          "${threeDaysLater!.month}" +
                                          "-" +
                                          "${threeDaysLater!.year}")),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Divider(
                          color: Colors.black,
                          thickness: 0.3.w,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "${S().grandTotal}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp),
                                  ),
                                  Text(
                                    widget.totalPrice,
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                ],
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              flex: 2,
                              child: AppButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      cubit.postUser(
                                          nameEditingController.text,
                                          addressEditingController.text,
                                          phoneEditingController.text);
                                      push(context, CongratulationCartScreen());
                                    }
                                  },
                                  label: "${S().checkout}",
                                  sizeFont: 16.sp,
                                  bgColor: AppColors.primary,
                                  borderRadius: BorderRadius.circular(12.sp)),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
