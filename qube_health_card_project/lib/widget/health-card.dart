import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qube_health_card_project/constant/app_colors.dart';
import 'package:qube_health_card_project/constant/app_image_path.dart';
import 'package:qube_health_card_project/constant/app_string.dart';
import 'package:sizer/sizer.dart';

Widget healthInsuranceDetails(
    {validUntil, paidBy, sumInsured, policyHolderName}) {
  return SizedBox(
    height: 27.h,
    width: 100.w,
    child: Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 19.h,
              /*decoration: const BoxDecoration(
                color: AppColors.cardColor,
              ),*/
              child: Stack(
                children: [
                  Container(
                    height: 21.h,
                    decoration: const BoxDecoration(color: Color(0xff90BEEF)),
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppString.healthInsurance,
                                  style: defaultTextStyle(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w400,
                                      size: 18.0),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  AppString.groupMediclaim,
                                  style: defaultTextStyle(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w400,
                                      size: 12.0),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  AppImagePath.insuranceLogo,
                                  height: 8.6.h,
                                  width: 8.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppString.insurance,
                                      style: defaultTextStyle(
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.w600,
                                          size: 13.0),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      AppString.companyName,
                                      style: defaultTextStyle(
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.w500,
                                          size: 8.0),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        cardDetails(
                            validUntil: validUntil,
                            paidBy: paidBy,
                            sumInsured: sumInsured),
                      ],
                    ),
                  ),
                  Positioned(
                    child: Image.asset(
                      AppImagePath.backgroundImage,
                      height: 19.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 6.h,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 19,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.policyHolderName,
                      style: TextStyle(
                          color: AppColors.textBlackColor.withAlpha(70),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'SFProRegular',
                          fontSize: 13.0),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          policyHolderName ?? 'aa',
                          style: const TextStyle(
                              color: AppColors.textBlackColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0),
                        ),
                        const SizedBox(
                          width: 250,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 1.2.h,
                              width: 2.0.w,
                              decoration: const BoxDecoration(
                                  color: Colors.green, shape: BoxShape.circle),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              AppString.active,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'SFProRegular',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.0),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget cardDetails({validUntil, paidBy, sumInsured}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            AppString.validUntil,
            style: defaultTextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w400,
                size: 12.0),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            validUntil ?? '',
            style: defaultTextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w500,
                size: 15.0),
          ),
        ],
      ),
      const SizedBox(
        width: 20,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            AppString.paidBy,
            style: defaultTextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w400,
                size: 12.0),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            paidBy ?? '',
            style: defaultTextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w500,
                size: 15.0),
          ),
        ],
      ),
      const SizedBox(
        width: 20,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            AppString.sumInsured,
            style: defaultTextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w400,
                size: 12.0),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            sumInsured ?? '',
            style: defaultTextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w500,
                size: 15.0),
          ),
        ],
      ),
    ],
  );
}

TextStyle defaultTextStyle({
  final color,
  final size,
  final fontWeight,
  final decoration,
}) =>
    TextStyle(
      decoration: decoration,
      color: color,
      fontSize: size ?? 14.0,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
