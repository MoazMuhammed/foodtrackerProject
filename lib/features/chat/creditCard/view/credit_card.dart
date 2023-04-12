import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/features/Home/view/home_screen.dart';
import 'package:foodtracker/features/drawer/widget/chat.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class CreditCard extends StatefulWidget {
  const CreditCard({Key? key}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(

          child: SafeArea(
            child: Column(
              children: <Widget>[
                ForgetPasswordBarWidget(onPressed: () => pop(context), title: "Credit Card"),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.sp,vertical: 18.sp),
                  child: CreditCardWidget(
                    glassmorphismConfig:
                    useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    bankName: 'Food Allergy',
                    frontCardBorder:
                    !useGlassMorphism ? Border.all(color: MyShared.getInt(key: MySharedKeys.theme) == 'dark' ? Colors.white : Colors.black) : null,
                    backCardBorder:
                    !useGlassMorphism ? Border.all(color: Colors.grey) : null,
                    showBackView: isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    isHolderNameVisible: true,
                    cardBgColor: AppColors.black,
                    backgroundImage:
                    useBackgroundImage ? 'assets/card_bg.png' : null,
                    isSwipeGestureEnabled: true,
                    onCreditCardWidgetChange:
                        (CreditCardBrand creditCardBrand) {},
                    customCardTypeIcons: <CustomCardTypeIcon>[
                      CustomCardTypeIcon(
                        cardType: CardType.mastercard,
                        cardImage: Image.asset(
                          'assets/mastercard.png',
                          height: 48.h,
                          width: 48.w,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.sp),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          CreditCardForm(
                            formKey: formKey,
                            obscureCvv: true,
                            obscureNumber: true,
                            cardNumber: cardNumber,
                            cvvCode: cvvCode,
                            isHolderNameVisible: true,
                            isCardNumberVisible: true,
                            isExpiryDateVisible: true,
                            cardHolderName: cardHolderName,
                            expiryDate: expiryDate,
                            themeColor: Colors.blue,
                            textColor:  MyShared.getInt(key: MySharedKeys.theme) == 1 ? Colors.white : Colors.black,
                            cardNumberDecoration: InputDecoration(
                              labelText: 'Number',
                              hintText: 'XXXX XXXX XXXX XXXX',
                              hintStyle:  TextStyle(color: MyShared.getInt(key: MySharedKeys.theme) == 1 ? Colors.white : Colors.black),
                              labelStyle:  TextStyle(color: MyShared.getInt(key: MySharedKeys.theme) == 1 ? Colors.white : Colors.black),
                              focusedBorder: border,
                              enabledBorder: border,
                            ),
                            expiryDateDecoration: InputDecoration(
                              hintStyle:  TextStyle(color: MyShared.getInt(key: MySharedKeys.theme) == 1 ? Colors.white : Colors.black),
                              labelStyle:  TextStyle(color: MyShared.getInt(key: MySharedKeys.theme) == 1 ? Colors.white : Colors.black),
                              focusedBorder: border,
                              enabledBorder: border,
                              labelText: 'Expired Date',
                              hintText: 'XX/XX',
                            ),
                            cvvCodeDecoration: InputDecoration(
                              hintStyle:  TextStyle(color: MyShared.getInt(key: MySharedKeys.theme) == 1 ? Colors.white : Colors.black),
                              labelStyle:  TextStyle(color: MyShared.getInt(key: MySharedKeys.theme) == 1 ? Colors.white : Colors.black),
                              focusedBorder: border,
                              enabledBorder: border,
                              labelText: 'CVV',
                              hintText: 'XXX',
                            ),
                            cardHolderDecoration: InputDecoration(
                              hintStyle:  TextStyle(color: MyShared.getInt(key: MySharedKeys.theme) == 1 ? Colors.white : Colors.black),
                              labelStyle:  TextStyle(color: MyShared.getInt(key: MySharedKeys.theme) == 1 ? Colors.white : Colors.black),
                              focusedBorder: border,
                              enabledBorder: border,
                              labelText: 'Card Holder',
                            ),
                            onCreditCardModelChange: onCreditCardModelChange,
                          ),
                           SizedBox(
                            height: 5.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              _onValidate();
                            },
                            child: Container(
                              margin:  EdgeInsets.symmetric(
                                  horizontal: 16.sp, vertical: 8.sp),
                              decoration: BoxDecoration(
                                color: AppColors.primary ,
                                // gradient: const LinearGradient(
                                //   colors: <Color>[
                                //     AppColors.primary,
                                //   ],
                                //   begin: Alignment(-1, -4),
                                //   end: Alignment(1, 4),
                                // ),
                                borderRadius: BorderRadius.circular(8.sp),
                              ),
                              padding:  EdgeInsets.symmetric(vertical: 15.sp),
                              width: double.infinity,
                              alignment: Alignment.center,
                              child:  Text(
                                'Validate',
                                style: TextStyle(
                                  color: Theme.of(context).brightness == Brightness.light ?Colors.white:Colors.black,
                                  fontFamily: 'halter',
                                  fontSize: 14.sp,
                                  package: 'flutter_credit_card',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 3.h,),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 12.sp,horizontal: 12.sp),
                            child: Center(
                              child: Row(
                                children: [
                                  Icon(Icons.error_outline_outlined,color: Colors.red,),
                                  SizedBox(width: 3.w,),
                                  Expanded(child: Text("Warning not to share bank account data and codes with any other parties."))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

void _onValidate() {
  if (formKey.currentState!.validate()) {
    print('valid!');
    push(context, ChatScreen());
  } else {
    print('invalid!');
  }
}

void onCreditCardModelChange(CreditCardModel? creditCardModel) {
  setState(() {
    cardNumber = creditCardModel!.cardNumber;
    expiryDate = creditCardModel.expiryDate;
    cardHolderName = creditCardModel.cardHolderName;
    cvvCode = creditCardModel.cvvCode;
    isCvvFocused = creditCardModel.isCvvFocused;
  });
}
}