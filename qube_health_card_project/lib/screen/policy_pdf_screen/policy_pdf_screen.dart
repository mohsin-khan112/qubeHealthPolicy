import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:qube_health_card_project/constant/app_colors.dart';
import 'package:qube_health_card_project/getx/controller/policy_audit_controller.dart';

class PolicyPdfScreen extends StatefulWidget {
  const PolicyPdfScreen({Key? key}) : super(key: key);

  @override
  _PolicyPdfScreenState createState() => _PolicyPdfScreenState();
}

class _PolicyPdfScreenState extends State<PolicyPdfScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PolicyAuditController>(
        init: PolicyAuditController(),
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.insuranceList?.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Text(
                                  controller.insuranceList![index].name!,
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                children: <Widget>[
                                  ListTile(
                                    title: ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: controller
                                            .insuranceList![index]
                                            .policies
                                            ?.length,
                                        itemBuilder: (context, index2) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller
                                                      .insuranceList![index]
                                                      .policies![index2],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 15,
                                                      color: AppColors
                                                          .textBlackColor
                                                          .withAlpha(80)),
                                                ),
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      })
                ],
              ),
            ),
          );
        });
  }
}
