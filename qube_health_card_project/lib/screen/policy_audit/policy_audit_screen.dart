import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qube_health_card_project/constant/app_colors.dart';
import 'package:qube_health_card_project/constant/app_image_path.dart';
import 'package:qube_health_card_project/constant/app_string.dart';
import 'package:qube_health_card_project/getx/controller/policy_audit_controller.dart';
import 'package:qube_health_card_project/getx/model/add_temp_recommendation_request_model.dart';
import 'package:qube_health_card_project/widget/health-card.dart';
import 'package:qube_health_card_project/widget/policy_audit_widget.dart';
import 'package:sizer/sizer.dart';

class PolicyAuditScreen extends StatefulWidget {
  const PolicyAuditScreen({Key? key}) : super(key: key);

  @override
  _PolicyAuditScreenState createState() => _PolicyAuditScreenState();
}

class _PolicyAuditScreenState extends State<PolicyAuditScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PolicyAuditController>(
        init: PolicyAuditController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              controller.yourAgeController.clear();
              controller.policySumController.clear();
              controller.payYearController.clear();
              controller.policyPlaneDropDownValue = null;
              controller.insuranceCompanyDropDownValue = null;
              controller.galleryPhoto = null;
              controller.cameraPhoto = null;
              controller.isUploadFile.value = false;
              controller.isValidConfirmButton.value = false;
              Get.back();
              return false;
            },
            child: Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 10.0,
                        spreadRadius: -7.0)
                  ]),
                  child: AppBar(
                    centerTitle: true,
                    backgroundColor: AppColors.appBarColor,
                    elevation: 0,
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: InkWell(
                        onTap: () {
                          controller.yourAgeController.clear();
                          controller.policySumController.clear();
                          controller.payYearController.clear();
                          controller.policyPlaneDropDownValue = null;
                          controller.insuranceCompanyDropDownValue = null;
                          controller.galleryPhoto = null;
                          controller.cameraPhoto = null;
                          controller.isUploadFile.value = false;
                          controller.isValidConfirmButton.value = false;
                          Get.back();
                        },
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              color: Color(0xffF1F0EF), shape: BoxShape.circle),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: const Text(
                      'Your Policy Audit',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 8),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(
                                'Powerd by',
                                style: defaultTextStyle(
                                    color:
                                        AppColors.textBlackColor.withAlpha(50),
                                    fontWeight: FontWeight.w400,
                                    size: 12.0),
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Image.asset(
                              AppImagePath.testMyPolicy,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text('Your Policy Cover'),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      policyGridView(controller),
                      const SizedBox(
                        height: 10,
                      ),
                      dropDownInsuranceCompany(),
                      const SizedBox(
                        height: 10,
                      ),
                      dropDownPolicyPlane(),
                      const SizedBox(
                        height: 20,
                      ),
                      insuranceAmountData(),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget policyGridView(PolicyAuditController controller) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: controller.personList.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 8 / 3),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = index;
              currentIndex == 0
                  ? controller.coveredValue.value = '1A'
                  : currentIndex == 1
                      ? controller.coveredValue.value = '2A'
                      : currentIndex == 2
                          ? controller.coveredValue.value = '2A1C'
                          : controller.coveredValue.value = '2A1C';
              if (currentIndex == index) {
                controller.isSelectedPolicyCover.value = false;
              } else {
                controller.isSelectedPolicyCover.value = true;
              }
            });
          },
          child: Card(
            color:
                currentIndex == index ? const Color(0xffEAF7EE) : Colors.white,
            shape: RoundedRectangleBorder(
              side: currentIndex == index
                  ? const BorderSide(color: Colors.green, width: 1)
                  : const BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 2, right: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    controller.personList[index].iconName!,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    controller.personList[index].name!,
                    style: const TextStyle(
                        color: AppColors.textBlackColor,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'SFProRegular',
                        fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget dropDownInsuranceCompany() {
    return GetX<PolicyAuditController>(
      builder: (controller) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.greyColor,
            border: controller.isValidInsuranceCompany.value == false
                ? Border.all(color: AppColors.greyColor)
                : Border.all(color: AppColors.errorColor)),
        padding: const EdgeInsets.only(left: 20, right: 28),
        child: DropdownButton<String?>(
          onChanged: (String? val) {
            if (val != null) {
              controller.isValidInsuranceCompany.value = false;
            } else {
              controller.isValidInsuranceCompany.value = true;
            }
            controller.onChangeInsuranceDropDownTile(val!);
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          hint: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              "Select Your insurance Company",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.textBlackColor.withAlpha(50),
                  fontFamily: 'SFProRegular'),
            ),
          ),
          focusColor: AppColors.greyColor,
          value: controller.insuranceCompanyDropDownValue,
          isExpanded: true,
          underline: Container(height: 1),
          style: const TextStyle(
              color: AppColors.textBlackColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
          //elevation: 5,
          selectedItemBuilder: (BuildContext context) {
            return controller.insuranceCompanyDropDownList.map((String value) {
              return Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  controller.insuranceCompanyDropDownValue.toString(),
                  style: const TextStyle(
                      color: AppColors.textBlackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              );
            }).toList();
          },
          iconEnabledColor: Colors.black,

          items: controller.insuranceCompanyDropDownList
              .map<DropdownMenuItem<String?>>((value) {
            return DropdownMenuItem<String?>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget dropDownPolicyPlane() {
    return GetX<PolicyAuditController>(
      builder: (controller) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.greyColor,
            border: controller.isValidPolicyPlan.value == false
                ? Border.all(color: AppColors.greyColor)
                : Border.all(color: AppColors.errorColor)),
        padding: const EdgeInsets.only(left: 20, right: 28),
        child: DropdownButton<String?>(
          onChanged: (String? val) {
            if (val != null) {
              controller.isValidPolicyPlan.value = false;
            } else {
              controller.isValidPolicyPlan.value = true;
            }
            controller.onChangePolicyDropDownTile(val!);
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          hint: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              "Select Policy plane",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.textBlackColor.withAlpha(50),
                  fontFamily: 'SFProRegular'),
            ),
          ),
          focusColor: AppColors.greyColor,
          value: controller.policyPlaneDropDownValue,
          isExpanded: true,
          underline: Container(height: 1),
          style: const TextStyle(
              color: AppColors.textBlackColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
          //elevation: 5,
          selectedItemBuilder: (BuildContext context) {
            return controller.policyPlaneDropDownList.map((String value) {
              return Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  controller.policyPlaneDropDownValue.toString(),
                  style: const TextStyle(
                      color: AppColors.textBlackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              );
            }).toList();
          },
          iconEnabledColor: Colors.black,

          items: controller.policyPlaneDropDownList
              .map<DropdownMenuItem<String?>>((value) {
            return DropdownMenuItem<String?>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget insuranceAmountData() {
    return GetX<PolicyAuditController>(
      builder: (controller) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              AppString.howMuchIsYourPolicySumInsured,
              style: TextStyle(
                  color: AppColors.textBlackColor.withAlpha(70),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SFProRegular',
                  fontSize: 15.0),
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          FieldAndLabel(
            borderColor: controller.isSumInsured.isFalse
                ? AppColors.greyColor
                : AppColors.errorColor,
            textEditingController: controller.policySumController,
            keyboardType: TextInputType.number,
            hintText: '\u{20B9} ${AppString.amout10K}',
            fillColor: AppColors.greyColor,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            maxLines: 1,
            textStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14.0,
                color: AppColors.textBlackColor),
            hintStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14.0,
                color: AppColors.textBlackColor.withAlpha(40)),
            onChanged: (String value) {
              if (value.isNotEmpty) {
                controller.isSumInsured.value = false;
              } else {
                controller.isSumInsured.value = true;
              }
              controller.validConfirmButton();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              AppString.howMuchIsPremiumDoYouPayPerYear,
              style: TextStyle(
                  color: AppColors.textBlackColor.withAlpha(70),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SFProRegular',
                  fontSize: 15.0),
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          FieldAndLabel(
            borderColor: controller.isPayPerYear.isFalse
                ? AppColors.greyColor
                : AppColors.errorColor,
            textEditingController: controller.payYearController,
            hintText: '\u{20B9} ${AppString.amout10K}',
            fillColor: AppColors.greyColor,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            keyboardType: TextInputType.number,
            maxLines: 1,
            textStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14.0,
                color: AppColors.textBlackColor),
            hintStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14.0,
                color: AppColors.textBlackColor.withAlpha(40)),
            onChanged: (String value) {
              if (value.isNotEmpty) {
                controller.isPayPerYear.value = false;
              } else {
                controller.isPayPerYear.value = true;
              }
              controller.validConfirmButton();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(AppString.yourAge,
                style: TextStyle(
                    color: AppColors.textBlackColor.withAlpha(70),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SFProRegular',
                    fontSize: 15.0)),
          ),
          const SizedBox(
            height: 9,
          ),
          SizedBox(
            height: 45,
            width: 180,
            child: FieldAndLabel(
              borderColor: controller.isValidAge.value == false
                  ? AppColors.greyColor
                  : AppColors.errorColor,
              textEditingController: controller.yourAgeController,
              hintText: '25',
              fillColor: AppColors.greyColor,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              maxLines: 2,
              keyboardType: TextInputType.number,
              hintStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14.0,
                  color: AppColors.textBlackColor.withAlpha(50)),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14.0,
                  color: AppColors.textBlackColor),
              onChanged: (String value) {
                if (value.isNotEmpty) {
                  controller.isValidAge.value = false;
                } else {
                  controller.isValidAge.value = true;
                }
                controller.validConfirmButton();
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              AppString.uploadYourCurrentHealthPolicy,
              style: TextStyle(
                  color: AppColors.textBlackColor.withAlpha(70),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SFProRegular',
                  fontSize: 15.0),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          SizedBox(
            height: 5.h,
            width: 35.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xffA7A7A7), // background, // foreground
              ),
              onPressed: () {
                chooseGalleryOrCameraBottomSheet(controller);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.upload,
                      style: defaultTextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                          size: 14.0),
                    ),
                    controller.isUploadFile.isFalse
                        ? Image.asset(AppImagePath.upload)
                        : const Icon(Icons.check)
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 6.h,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: controller.isValidConfirmButton.isFalse
                      ? Color(0xffC4C4C4)
                      : AppColors.greenColor, // background, // foreground
                ),
                onPressed: () {
                  controller.validation();
                  if (controller.insuranceCompanyDropDownValue != null &&
                          controller.policyPlaneDropDownValue != null &&
                          controller.policySumController.text.isNotEmpty &&
                          controller.payYearController.text.isNotEmpty &&
                          controller.yourAgeController.text.isNotEmpty &&
                          controller.galleryPhoto != null ||
                      controller.cameraPhoto != null) {
                    AddTmpRecommendationRequestModel model =
                        AddTmpRecommendationRequestModel(
                      coveredMembers: controller.coveredValue.value,
                      companyName: controller.insuranceCompanyDropDownValue,
                      companyPlan: controller.policyPlaneDropDownValue,
                      sumInsured: controller.policySumController.text,
                      premium: controller.payYearController.text,
                      age: controller.yourAgeController.text,
                    );
                    controller.addTempRecommendationValue(model);
                  } else {
                    print('error');
                  }
                },
                child: Center(
                  child:controller.isLoading.isFalse? Text(
                    'Confirm',
                    style: defaultTextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                        size: 14.0),
                  ):const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  chooseGalleryOrCameraBottomSheet(PolicyAuditController controller) {
    return showModalBottomSheet(
      context: context,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: 20.h,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.galleryImage();
                              Get.back();
                            },
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Icon(Icons.upload_rounded),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'File',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () async {
                              controller.cameraImage();
                            },
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 21,
                                    color: AppColors.textBlackColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Camera',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  chooseGalleryOrCamera(BuildContext context) {
    showDialog(
        useSafeArea: true,
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.only(
              left: 2,
              right: 2,
            ),
            insetPadding: const EdgeInsets.all(0),
            content: SizedBox(
              width: MediaQuery.of(context).size.width - 80,
              child: StatefulBuilder(
                builder: (BuildContext context,
                        void Function(void Function()) function) =>
                    GetBuilder<PolicyAuditController>(
                  init: PolicyAuditController(),
                  builder: (controller) {
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.galleryImage();
                                Get.back();
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppImagePath.galleryIcon,
                                    height: 42,
                                    width: 42,
                                  ),
                                  const Text(
                                    'Gallery',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            InkWell(
                              onTap: () async {
                                controller.cameraImage();
                                Get.back();
                              },
                              child: Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(left: 12),
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      size: 21,
                                      color: AppColors.textBlueColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Camera',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                    );
                  },
                ),
              ),
            ),
          );
        });
  }
}
