import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qube_health_card_project/constant/app_image_path.dart';
import 'package:qube_health_card_project/getx/model/add_temp_recommendation_request_model.dart';
import 'package:qube_health_card_project/getx/model/insurance_response_model.dart';
import 'package:qube_health_card_project/getx/provider/api/policy_audit_api.dart';
import 'package:qube_health_card_project/routes/app_routes.dart';

class PolicyAuditController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxList<Person> personList = <Person>[].obs;
  TextEditingController policySumController = TextEditingController();
  TextEditingController payYearController = TextEditingController();
  TextEditingController yourAgeController = TextEditingController();
  RxBool isSelectedPolicyCover = false.obs;
  RxBool isValidInsuranceCompany = false.obs;
  RxBool isValidPolicyPlan = false.obs;
  RxBool isSumInsured = false.obs;
  RxBool isPayPerYear = false.obs;
  RxBool isValidAge = false.obs;
  RxBool isUploadFile = false.obs;
  RxBool isValidConfirmButton = false.obs;
  XFile? galleryPhoto;
  XFile? cameraPhoto;
  String? insuranceCompanyDropDownValue;
  String? policyPlaneDropDownValue;
  RxString coveredValue = '1A'.obs;

  RxBool isLoading = false.obs;
  RxList<Insurance>? insuranceList = <Insurance>[].obs;

  RxList<String> insuranceCompanyDropDownList = <String>[
    'AcKo General ',
    'Aditya birla',
    'Bajaj Allianz',
    'Bharti Axa',
  ].obs;
  RxList<String> policyPlaneDropDownList = <String>[
    'AcKo General ',
    'Aditya birla',
    'Bajaj Allianz',
    'Bharti Axa',
  ].obs;

  @override
  void onInit() async {
    super.onInit();

    personList.value = [
      Person(name: "1 Adult", iconName: AppImagePath.person1),
      Person(name: "2 Adult", iconName: AppImagePath.person2),
      Person(name: "2 Adult + 1 child", iconName: AppImagePath.person3),
      Person(name: "Other Member", iconName: AppImagePath.otherPerson),
    ];
  }

  onChangeInsuranceDropDownTile(String val) {
    validConfirmButton();
    insuranceCompanyDropDownValue = val;
    update();
  }

  onChangePolicyDropDownTile(String val) {
    validConfirmButton();
    policyPlaneDropDownValue = val;
    update();
  }

  cameraImage() async {
    galleryPhoto == null;
    ImagePicker picker = ImagePicker();
    cameraPhoto = await picker.pickImage(source: ImageSource.camera);

    if (cameraPhoto != null) {
      isUploadFile.value = true;
    } else {
      isUploadFile.value = false;
    }
    validConfirmButton();
    update();
  }

  galleryImage() async {
    cameraPhoto == null;
    ImagePicker picker = ImagePicker();
    galleryPhoto = await picker.pickImage(source: ImageSource.gallery);
    if (galleryPhoto != null) {
      isUploadFile.value = true;
    } else {
      isUploadFile.value = false;
    }
    validConfirmButton();
    update();
  }

  validConfirmButton() {
    if (insuranceCompanyDropDownValue != null &&
            policyPlaneDropDownValue != null &&
            policySumController.text.isNotEmpty &&
            payYearController.text.isNotEmpty &&
            yourAgeController.text.isNotEmpty &&
            galleryPhoto != null ||
        cameraPhoto != null) {
      isValidConfirmButton.value = true;
    } else {
      isValidConfirmButton.value = false;
    }
  }

  validation() {
    if (insuranceCompanyDropDownValue == null) {
      isValidInsuranceCompany.value = true;
    } else {
      isValidInsuranceCompany.value = false;
    }
    if (policyPlaneDropDownValue == null) {
      isValidPolicyPlan.value = true;
    } else {
      isValidPolicyPlan.value = false;
    }

    if (policySumController.text.isNotEmpty) {
      isSumInsured.value = false;
    } else {
      isSumInsured.value = true;
    }

    if (payYearController.text.isNotEmpty) {
      isPayPerYear.value = false;
    } else {
      isPayPerYear.value = true;
    }

    if (yourAgeController.text.isNotEmpty) {
      isValidAge.value = false;
    } else {
      isValidAge.value = true;
    }
  }

  addTempRecommendationValue(AddTmpRecommendationRequestModel model) async {
    isLoading.value = true;
    insuranceList?.value =
        (await PolicyAuditApi.getTMPRecommendationApi(model))!;
    if (insuranceList != null) {
      yourAgeController.clear();
      policySumController.clear();
      payYearController.clear();
      policyPlaneDropDownValue = null;
      insuranceCompanyDropDownValue = null;
      galleryPhoto = null;
      cameraPhoto = null;
      isUploadFile.value = false;
      isValidConfirmButton.value = false;
      Get.toNamed(Routes.policyPdfScreen);
    }
    isLoading.value = false;
  }
}

class Person {
  String? name;
  String? iconName;

  Person({this.name, this.iconName});
}
