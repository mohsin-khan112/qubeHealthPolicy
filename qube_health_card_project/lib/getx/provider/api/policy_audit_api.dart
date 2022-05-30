import 'package:dio/dio.dart';
import 'package:qube_health_card_project/getx/model/add_temp_recommendation_request_model.dart';
import 'package:qube_health_card_project/getx/model/insurance_response_model.dart';

import '../rest_api.dart';

class PolicyAuditApi {
  static Future<List<Insurance>?> getTMPRecommendationApi(
      AddTmpRecommendationRequestModel model) async {
    var dio = Dio();
    String token = 'f6d646a6c2f2df883ea0cccaa4097358ede98284';
    Map<String, dynamic> request = {
      "covered_members": model.coveredMembers,
      "company_name": model.companyName,
      "company_plan": model.companyPlan,
      "sum_insured": model.sumInsured,
      "premium": model.premium,
      "age": model.age
    };

    final response = await dio.post(
        '${RestAPI.API_BASE_URL}${RestAPI.getTMPRecommendation}',
        options: Options(headers: {'X-Api-Key': token, 'Token': 'r6nmCgWzhw'}),
        data: request);

    if (response.statusCode == 200) {
      final insuranceList =
          Insurance.getInsurancePolicies(response.data["data"]);
      return insuranceList;
    }
  }
}
