import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:qube_health_card_project/constant/app_colors.dart';
import 'package:qube_health_card_project/constant/app_image_path.dart';
import 'package:qube_health_card_project/constant/app_string.dart';
import 'package:qube_health_card_project/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

import 'health-card.dart';

Widget insuranceDetails(
    {policyNumber, premium, nextDueOn, whoisCovered, confirmClick}) {
  return Container(
    decoration: BoxDecoration(color: AppColors.textBlackColor.withAlpha(10)),
    height: 36.2.h,
    child: Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.yourInsuranceDetails,
            style: defaultTextStyle(
                color: AppColors.textBlackColor,
                fontWeight: FontWeight.w400,
                size: 15.0),
          ),
          const SizedBox(
            height: 24,
          ),
          textRow(AppString.policyNumber, policyNumber),
          const SizedBox(
            height: 20,
          ),
          textRow(AppString.premium, premium),
          const SizedBox(
            height: 20,
          ),
          textRow(AppString.nextDueOn, nextDueOn),
          const SizedBox(
            height: 20,
          ),
          textRow(AppString.whoIsCovered, whoisCovered),
          const SizedBox(
            height: 20,
          ),
          const Text(
            AppString.getPaymentReminderWhatsup,
            style: TextStyle(
                color: AppColors.textBlackColor,
                fontWeight: FontWeight.w400,
                fontFamily: 'SFProRoundedMedium',
                fontSize: 15.0),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: confirmClick ?? () {},
            child: Container(
                decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  border: Border.all(width: 2, color: AppColors.greenColor),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                height: 6.h,
                width: double.infinity,
                child: Center(
                  child: Text(
                    AppString.confirm,
                    style: defaultTextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w400,
                        size: 15.0),
                  ),
                )),
          )
        ],
      ),
    ),
  );
}

Widget textRow(text, value) {
  return Padding(
    padding: const EdgeInsets.only(left: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              color: AppColors.textBlackColor.withAlpha(100),
              fontWeight: FontWeight.w400,
              fontFamily: 'SFProRegular',
              fontSize: 12.0),
        ),
        const SizedBox(
          width: 70,
        ),
        Text(
          value ?? '',
          style: const TextStyle(
              color: Color(0xff37B158),
              fontWeight: FontWeight.w500,
              fontFamily: 'SFProRegular',
              fontSize: 14.0),
        ),
      ],
    ),
  );
}

Widget findHospital() {
  return Container(
    height: 7.h,
    margin: const EdgeInsets.only(left: 19, right: 19),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(const Radius.circular(10)),
      border: Border.all(width: 2, color: AppColors.greenColor),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        children: [
          Image.asset(
            AppImagePath.mapImage,
            height: 24,
            width: 24,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            AppString.findHospitalInclude,
            style: defaultTextStyle(
                color: const Color(0xff474747),
                fontWeight: FontWeight.w500,
                size: 14.0),
          ),
          const SizedBox(
            width: 44,
          ),
          Image.asset(
            AppImagePath.arrow,
            height: 24,
            width: 24,
          ),
        ],
      ),
    ),
  );
}

Widget personHealthyPolicyUI() {
  return SizedBox(
    height: 16.0.h,
    child: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 192,
              child: Stack(
                children: [
                  Positioned(
                    child: Image.asset(
                      AppImagePath.person,
                      height: 130,
                      width: 120,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 5,
                    child: Column(
                      children: [
                        Text(
                          'Powered By',
                          style: defaultTextStyle(
                              color: AppColors.textBlackColor.withAlpha(50),
                              fontWeight: FontWeight.w500,
                              size: 14.0),
                        ),
                        Image.asset(
                          AppImagePath.testMyPolicy,
                          fit: BoxFit.fill,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 5),
              child: Column(
                children: [
                  Text(
                    'Does Your Healthy policy',
                    style: defaultTextStyle(
                        color: const Color(0xff474747),
                        fontWeight: FontWeight.w500,
                        size: 14.0),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    '   gives you the coverage',
                    style: defaultTextStyle(
                        color: const Color(0xff474747),
                        fontWeight: FontWeight.w500,
                        size: 14.0),
                  ),
                  Text(
                    '                 you need?',
                    style: defaultTextStyle(
                        color: const Color(0xff474747),
                        fontWeight: FontWeight.w500,
                        size: 14.0),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.policyAuditScreen);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.greenColor,
                        border:
                            Border.all(width: 2, color: AppColors.greenColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                      ),
                      height: 4.h,
                      width: 120,
                      child: Center(
                        child: Text(
                          'Check Out Now',
                          style: defaultTextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w500,
                              size: 14.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
