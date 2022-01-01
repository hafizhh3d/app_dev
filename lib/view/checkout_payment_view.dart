import 'package:digati/view/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/viewmodel/cart_viewmodel.dart';
import '../core/viewmodel/card_viewmodel.dart';
import 'widgets/custom_button.dart';
import '../constants.dart';
import 'checkout_view.dart';
import 'widgets/custom_text.dart';
import 'widgets/custom_textFormField.dart';

class CheckoutPaymentView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 130.h,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24.h, left: 16.w, right: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  CustomText(
                    text: 'Payment',
                    fontSize: 20,
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 24.h),
                child: Form(
                  key: _formKey,
                  child: GetBuilder<CardViewModel>(
                    init: Get.find<CardViewModel>(),
                    builder: (controller) => Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          title: 'Card Number',
                          hintText: '1234 1234 1234 1234',
                          validatorFn: (value) {
                            if (value!.isEmpty || value.length < 4)
                              return 'Please enter valid card number.';
                          },
                          onSavedFn: (value) {
                            controller.cardNum = value;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          title: 'Name',
                          hintText: 'Alex',
                          validatorFn: (value) {
                            if (value!.isEmpty || value.length < 4)
                              return 'Please enter valid name.';
                          },
                          onSavedFn: (value) {
                            controller.name = value;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                title: 'Expiry Date',
                                hintText: '01/21',
                                validatorFn: (value) {
                                  if (value!.isEmpty || value.length < 2)
                                    return 'Please enter valid expiry date.';
                                },
                                onSavedFn: (value) {
                                  controller.expDate = value;
                                },
                              ),
                            ),
                            SizedBox(
                              width: 36.w,
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                title: 'CVV',
                                hintText: '123',
                                validatorFn: (value) {
                                  if (value!.isEmpty ||
                                      value.length < 3 ||
                                      value.length > 3)
                                    return 'Please enter valid cvv number.';
                                },
                                onSavedFn: (value) {
                                  controller.cvv = value;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          title: 'Email',
                          hintText: 'mail@example.com',
                          keyboardType: TextInputType.phone,
                          validatorFn: (value) {
                            if (value!.isEmpty ||
                                value.length < 5 ||
                                !value.contains('@'))
                              return 'Please enter valid email.';
                          },
                          onSavedFn: (value) {
                            controller.email = value;
                          },
                        ),
                        SizedBox(
                          height: 38.h,
                        ),
                        CustomButton(
                          'SUBMIT',
                          () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              await controller.addCardToFireStore();
                              //Get.to(CheckoutView());
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
