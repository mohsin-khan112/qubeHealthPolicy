

class AddTmpRecommendationRequestModel {
  AddTmpRecommendationRequestModel({
    this.coveredMembers,
    this.companyName,
    this.companyPlan,
    this.sumInsured,
    this.premium,
    this.age,
  });

  String? coveredMembers;
  String? companyName;
  String? companyPlan;
  String? sumInsured;
  String? premium;
  String? age;

  factory AddTmpRecommendationRequestModel.fromJson(Map<String, dynamic> json) => AddTmpRecommendationRequestModel(
    coveredMembers: json["covered_members"],
    companyName: json["company_name"],
    companyPlan: json["company_plan"],
    sumInsured: json["sum_insured"],
    premium: json["premium"],
    age: json["age"],
  );

  Map<String, dynamic> toJson() => {
    "covered_members": coveredMembers,
    "company_name": companyName,
    "company_plan": companyPlan,
    "sum_insured": sumInsured,
    "premium": premium,
    "age": age,
  };
}
