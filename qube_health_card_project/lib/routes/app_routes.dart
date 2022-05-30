// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:qube_health_card_project/screen/health_insurance_screen/health_insurance_screen.dart';
import 'package:qube_health_card_project/screen/policy_audit/policy_audit_screen.dart';
import 'package:qube_health_card_project/screen/policy_pdf_screen/policy_pdf_screen.dart';


class Routes {
  static const firstScreen = '/healthInsuranceScreen';
  static const policyAuditScreen  = '/policyAuditScreen';
  static const policyPdfScreen  = '/policyPdfScreen';

}

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: Routes.firstScreen,
      page: () => const HealthInsuranceScreen(),
    ),
    GetPage(
      name: Routes.policyAuditScreen,
      page: () => const PolicyAuditScreen(),
    ),
    GetPage(
      name: Routes.policyPdfScreen,
      page: () => const PolicyPdfScreen(),
    ),

  ];
}
