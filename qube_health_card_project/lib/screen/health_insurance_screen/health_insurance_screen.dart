import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qube_health_card_project/constant/app_colors.dart';
import 'package:qube_health_card_project/constant/app_string.dart';
import 'package:qube_health_card_project/getx/controller/health_insurance_controller.dart';
import 'package:qube_health_card_project/getx/controller/policy_audit_controller.dart';
import 'package:qube_health_card_project/widget/health-card.dart';
import 'package:qube_health_card_project/widget/insurance_details.dart';
import 'package:sizer/sizer.dart';

class HealthInsuranceScreen extends StatefulWidget {
  const HealthInsuranceScreen({Key? key}) : super(key: key);

  @override
  _HealthInsuranceScreenState createState() => _HealthInsuranceScreenState();
}

class _HealthInsuranceScreenState extends State<HealthInsuranceScreen> {
  List<Notes> listNote = [];
  final controller = Get.put(PolicyAuditController());

  List<String> dataList = [
    'Dental Surgry',
    'Congenital external defects',
    'Convalescence',
    'Veneral disease'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addNotes();
  }

  addNotes() {
    listNote = [
      Notes(
          title: "Is room rent  include my insurance",
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Elementum nisl, pellentesque malesuada ornare lectus sed enim, lobortis ac. Fusce blandit eget in sem orci eget justo pharetra. Faucibus tortor adipiscing accumsan tortor turpis sem. Aenean at in lectus non, felis pellentesque lorem ornare ut.'),
      Notes(
          title: "Is room rent  include my insurance",
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Elementum nisl, pellentesque malesuada ornare lectus sed enim, lobortis ac. Fusce blandit eget in sem orci eget justo pharetra. Faucibus tortor adipiscing accumsan tortor turpis sem. Aenean at in lectus non, felis pellentesque lorem ornare ut.'),
      Notes(
          title: "Is room rent  include my insurance",
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Elementum nisl, pellentesque malesuada ornare lectus sed enim, lobortis ac. Fusce blandit eget in sem orci eget justo pharetra. Faucibus tortor adipiscing accumsan tortor turpis sem. Aenean at in lectus non, felis pellentesque lorem ornare ut.'),
      Notes(
          title: "Is room rent  include my insurance",
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Elementum nisl, pellentesque malesuada ornare lectus sed enim, lobortis ac. Fusce blandit eget in sem orci eget justo pharetra. Faucibus tortor adipiscing accumsan tortor turpis sem. Aenean at in lectus non, felis pellentesque lorem ornare ut.'),
      Notes(
          title: "Is room rent  include my insurance",
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Elementum nisl, pellentesque malesuada ornare lectus sed enim, lobortis ac. Fusce blandit eget in sem orci eget justo pharetra. Faucibus tortor adipiscing accumsan tortor turpis sem. Aenean at in lectus non, felis pellentesque lorem ornare ut.'),
    ];
  }

  @override
  Widget build(BuildContext context) {
   double height = MediaQuery.of(context).size.height;
   double width = MediaQuery.of(context).size.width;

   print('height:${height}');
   print('height:${width}');
    return GetBuilder<HealthInsuranceController>(
        init: HealthInsuranceController(),
        builder: (controller) {
          return SafeArea(
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
                        onTap: () {},
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
                      'Insurance',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 21),
                  child: Column(
                    children: [
                      personDetails(),
                      insuranceDetailsPolicy(),
                      findHospitalUI(),
                      faqsUI(listNote),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget personDetails() {
    return Container(
      height: 36.h,
      color: AppColors.backgroundColor,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 27.2.h,
            width: double.infinity,
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return healthInsuranceDetails();
                }),
          ),
          const SizedBox(
            height: 14,
          ),
          policy(),
        ],
      ),
    );
  }

  Widget policy() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.textBlueColor,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            height: 5.5.h,
            width: 42.w,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.add,
                      color: AppColors.textBlueColor,
                    ),
                  ),
                  const Text(
                    AppString.uploadNewPolicy,
                    style: TextStyle(
                        color: AppColors.textBlueColor,
                        fontFamily: 'SFProRegular',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Container(
            height: 5.5.h,
            width: 42.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.greenColor, // background, // foreground
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 12),
                child: Row(
                  children: const [
                    Icon(
                      Icons.event_note_sharp,
                      color: AppColors.whiteColor,
                    ),
                    Text(
                      AppString.viewPolicy,
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget insuranceDetailsPolicy() {
    return insuranceDetails(
        policyNumber: '401610147732905000',
        nextDueOn: '\u{20B9}30,000',
        premium: '05 April 2022',
        whoisCovered: 'You and 1 other',
        confirmClick: () {});
  }

  Widget findHospitalUI() {
    return Container(
      height: 28.h,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            findHospital(),
            const SizedBox(
              height: 14,
            ),
            personHealthyPolicyUI()
          ],
        ),
      ),
    );
  }

  Widget faqsUI(List<Notes> listNote) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'FAQs',
                style: defaultTextStyle(
                    color: AppColors.textBlackColor,
                    fontWeight: FontWeight.w500,
                    size: 15.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffC4C4C4),
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.black.withAlpha(120),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "How Can We Help?",
                        hintStyle: TextStyle(
                          color: Colors.black.withAlpha(120),
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (String text) {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            tabBar(listNote),
            const SizedBox(
              height: 21,
            ),

          ],
        ),
      ),
    );
  }

  Widget _tabBarViewContent(int currentTabIndex, List<Notes> listNote) {
    Widget? content;
    switch (currentTabIndex) {
      case 0:
        content = expansionTile(listNote);
        break;
      case 1:
        content = diseaseList();
        break;
      default:
        content = expansionTile(listNote);
    }
    return content;
  }

  Widget tabBar(List<Notes> listNote) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicator: BoxDecoration(
              color: Color(0xffEAF7EE),

              border: Border.all(

                color: AppColors.greenColor,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            tabs: [
              Container(
                height: 6.h,
                width: 45.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'What does my',
                      style: defaultTextStyle(
                          color: const Color(0xff474747),
                          fontWeight: FontWeight.w500,
                          size: 14.0),
                    ),
                    Text(
                      'insurance Cover?',
                      style: defaultTextStyle(
                          color: const Color(0xff474747),
                          fontWeight: FontWeight.w500,
                          size: 14.0),
                    ),
                  ],
                ),
              ),
              Container(
                height: 6.h,
                width: 45.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'What does it',
                      style: defaultTextStyle(
                          color: const Color(0xff474747),
                          fontWeight: FontWeight.w500,
                          size: 14.0),
                    ),
                    Text(
                      'Not',
                      style: defaultTextStyle(
                          color: const Color(0xff474747),
                          fontWeight: FontWeight.w500,
                          size: 14.0),
                    ),
                  ],
                ),
              ),
            ],
            onTap: (int index) {
              controller.currentIndex.value = index;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => _tabBarViewContent(controller.currentIndex.value, listNote),
          )
        ],
      ),
    );
  }

  Widget insuranceCoverUI() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.greenColor,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          height: 6.h,
          width: 45.w,
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'What does my',
                    style: defaultTextStyle(
                        color: const Color(0xff474747),
                        fontWeight: FontWeight.w500,
                        size: 14.0),
                  ),
                  Text(
                    'insurance Cover?',
                    style: defaultTextStyle(
                        color: const Color(0xff474747),
                        fontWeight: FontWeight.w500,
                        size: 14.0),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 73,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'What does it',
              style: defaultTextStyle(
                  color: const Color(0xff474747),
                  fontWeight: FontWeight.w500,
                  size: 14.0),
            ),
            Text(
              'Not',
              style: defaultTextStyle(
                  color: const Color(0xff474747),
                  fontWeight: FontWeight.w500,
                  size: 14.0),
            ),
          ],
        ),
      ],
    );
  }

  Widget expansionTile(List<Notes> listNote) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listNote.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    listNote[index].title!,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        listNote[index].description!,
                        style:  TextStyle(fontWeight: FontWeight.w400,fontSize: 15,
                            color: AppColors.textBlackColor.withAlpha(70)),
                      ),
                    )
                  ],
                ),
              ),
              Text(
                "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -",
                style: TextStyle(color: const Color(0xff000000).withAlpha(50)),
              )
            ],
          );
        });
  }

  Widget diseaseList() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
      ),
      child: ListView.builder(
          itemCount: dataList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  dataList[index],
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -",
                  style:
                      TextStyle(color: const Color(0xff000000).withAlpha(50)),
                )
              ],
            );
          }),
    );
  }
}

class Notes {
  String? title;
  String? description;

  Notes({this.title, this.description});
}
