class Insurance {
  Insurance({this.name, this.policies});

  String? name;
  List<String>? policies = [];

  static List<Insurance> getInsurancePolicies(Map<String, dynamic> json) {
    List<Insurance> list = <Insurance>[];
    json.forEach((key, value) {
      final insurance = Insurance(
          name: key,
          policies: (value as List).map((e) => e as String).toList());
      list.add(insurance);
    });

    return list;
  }
}
