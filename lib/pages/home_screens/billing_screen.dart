import 'package:flutter/material.dart';
import 'package:vandana/components/app_text_style.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/components/static_decoration.dart';
import 'package:vandana/controllers/billing_controller.dart';
import 'package:vandana/pages/add_address_screen.dart';
import 'package:vandana/pages/thankyou_screen.dart';
import 'package:vandana/widget/dottedline_widget.dart';
import 'package:get/get.dart';
import 'package:vandana/widget/radio_button_widget.dart';
import 'package:vandana/widget/scroll_widget/scroll_widget.dart';
import 'package:vandana/widget/select_vegetable_widget.dart';
import 'package:vandana/widget/text_widgets/input_text_field_widget.dart';
import 'package:vandana/widget/time_slote_widget.dart';
import 'package:intl/intl.dart';

class BillingScreen extends StatefulWidget {
  BillingScreen(
      {super.key,
      required this.fromType,
      required this.itemDescription,
      required this.Price,
      required this.mrp,
      required this.weekendPrice,
      required this.mainImage,
      required this.itemName,
      required this.tiffinCount,
      required this.getSabjiList});
  int? fromType;
  String? weekendPrice;
  String? itemDescription;
  String? Price;
  String? mainImage;
  String? itemName;
  String? mrp;
  String? tiffinCount;
  List? getSabjiList;
  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen>
    with SingleTickerProviderStateMixin {
  BillingController billingController = Get.put(BillingController());
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 7, vsync: this);
    getData();
    getNext7Days();
  }

  List<DateTime> next7Days = [];
  List<String> daysName = [];
  List<DateTime> getNext7Days() {
    // Get the current date
    DateTime currentDate = DateTime.now();

    // Generate the next 7 days
    for (int i = 0; i < 7; i++) {
      DateTime nextDay = currentDate.add(Duration(days: i));
      next7Days.add(nextDay);
    }
    next7Days.map(
      (dateWithDay) {
        daysName.add(getDayNameFromNumber(dateWithDay.weekday));
        print(
          '${dateWithDay.day}: ${dateWithDay.weekday}',
        );
      },
    ).toList();

    daysName.map((e) => print(e.toString()));
    return next7Days;
  }

  String getDayNameFromNumber(int weekdayNumber) {
    if (weekdayNumber >= 1 && weekdayNumber <= 7) {
      List<String> weekdays = [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday'
      ];
      print("Check day ==> ${weekdays[weekdayNumber - 1]}");
      return weekdays[weekdayNumber - 1];
    } else {
      return 'Invalid weekday number';
    }
  }

  getData() async {
    await billingController.getpackagingData();
    await billingController
        .getWeekendCount(double.parse(widget.weekendPrice.toString()));
    await billingController.getTotalCount(
        tiffinCount: widget.tiffinCount,
        tiffinPrice: widget.Price,
        ecoFriendly: billingController
            .getpackagingDataModel.value.packagingList?[1].packagingPrice,
        regular: billingController
            .getpackagingDataModel.value.packagingList?[0].packagingPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: billingController.billingScrollController,
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: header(
              movieName: "",
              movieDescription: "",
              image: widget.mainImage ?? "",
              imdb: "",
              price: "",
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  width: double.infinity,
                  color: Color(0xffFEF3EB),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            height20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.itemName ?? "",
                                      style: AppTextStyle.normalSemiBold22
                                          .copyWith(
                                              color: appMainColor,
                                              fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.5,
                                      child: Text(
                                        widget.itemDescription ?? "",
                                        style: AppTextStyle.normalSemiBold18
                                            .copyWith(
                                                color: appMainColorLite,
                                                fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                width10,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'Mrp ',
                                        style: AppTextStyle.normalSemiBold20
                                            .copyWith(
                                                fontSize: 24,
                                                color: Colors.red),
                                        children: [
                                          TextSpan(
                                            text: widget.mrp,
                                            style: AppTextStyle.normalSemiBold20
                                                .copyWith(
                                              fontSize: 24,
                                              color: Colors.red,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "Price: ${widget.Price}",
                                      style: AppTextStyle.normalSemiBold22
                                          .copyWith(
                                              fontSize: 24, color: greenColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            height20,
                            HorizontalDottedLine(),
                            height20,
                            Text(
                              "Select Sabji",
                              style: AppTextStyle.normalSemiBold22.copyWith(
                                  color: appMainColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            height05,
                            DefaultTabController(
                              length: 7,
                              child: TabBar(
                                controller: tabController,
                                labelColor: appMainColor,
                                isScrollable: true,
                                tabs: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("${next7Days[0].day}"),
                                          Text(" - ${next7Days[0].month}"),
                                        ],
                                      ),
                                      Tab(text: daysName[0]),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("${next7Days[1].day}"),
                                           Text(" - ${next7Days[1].month}"),
                                        ],
                                      ),
                                      Tab(text: daysName[1]),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("${next7Days[2].day}"),
                                           Text(" - ${next7Days[2].month}"),
                                        ],
                                      ),
                                      Tab(text: daysName[2]),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("${next7Days[3].day}"),
                                           Text(" - ${next7Days[3].month}"),
                                        ],
                                      ),
                                      Tab(text: daysName[3]),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("${next7Days[4].day}"),
                                           Text(" - ${next7Days[4].month}"),
                                        ],
                                      ),
                                      Tab(text: daysName[4]),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("${next7Days[5].day}"),
                                           Text(" - ${next7Days[5].month}"),
                                        ],
                                      ),

                                      Tab(text: daysName[5]),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("${next7Days[6].day}"),
                                           Text(" - ${next7Days[6].month}"),
                                        ],
                                      ),
                                      Tab(text: daysName[6]),
                                    ],
                                  ),
                                 
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.34,
                              child: TabBarView(
                                  controller: tabController,
                                  children: [
                                    // Content for Monday
                                    SelectVegetableWidget(
                                        vegeTableList:
                                            widget.getSabjiList ?? []),
                                    SelectVegetableWidget(
                                        vegeTableList:
                                            widget.getSabjiList ?? []),
                                    SelectVegetableWidget(
                                        vegeTableList:
                                            widget.getSabjiList ?? []),
                                    SelectVegetableWidget(
                                        vegeTableList:
                                            widget.getSabjiList ?? []),
                                    SelectVegetableWidget(
                                        vegeTableList:
                                            widget.getSabjiList ?? []),
                                    SelectVegetableWidget(
                                        vegeTableList:
                                            widget.getSabjiList ?? []),
                                    SelectVegetableWidget(
                                        vegeTableList:
                                            widget.getSabjiList ?? []),
                                  ]),
                            ),
                            //! TIFFIN TYPE
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                height20,
                                HorizontalDottedLine(),
                                height20,
                                Text(
                                  "Tiffin Type",
                                  style: AppTextStyle.normalSemiBold22.copyWith(
                                      color: appMainColor,
                                      fontWeight: FontWeight.w400),
                                ),
                                height20,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          billingController
                                                  .tiffinTypeLunch.value =
                                              !billingController
                                                  .tiffinTypeLunch.value;
                                        },
                                        child: CustomRadioButton(
                                            buttonName: "Lunch",
                                            isSelected: billingController
                                                .tiffinTypeLunch)),
                                    width10,
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            await billingController
                                                .getTimeSlot(true);
                                            showTimeSlotePopUP(
                                                context,
                                                billingController
                                                    .getTimeSlotModel
                                                    .value
                                                    .timeslotList!,
                                                true);
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: primaryWhite,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 1,
                                                  blurRadius: 2,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Obx(
                                              () => Text(
                                                billingController
                                                    .selectedLunchTime.value,
                                                textAlign: TextAlign.center,
                                                style: AppTextStyle
                                                    .normalRegular14
                                                    .copyWith(
                                                        color: appMainColor,
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: appMainColor,
                                        ),
                                        width05,
                                        GestureDetector(
                                          onTap: () async {
                                            billingController
                                                .isLunchOfficeSelected
                                                .value = false;
                                            billingController
                                                .isLunchHomeSelected
                                                .value = true;
                                            print(
                                                "check data ==> ${billingController.isLunchOfficeSelected.value}");
                                          },
                                          child: Obx(
                                            () => Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: billingController
                                                              .isLunchHomeSelected
                                                              .value ==
                                                          true
                                                      ? appMainColor
                                                      : appMainColorLite,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Icon(Icons.home),
                                            ),
                                          ),
                                        ),
                                        width05,
                                        GestureDetector(
                                          onTap: () async {
                                            billingController
                                                .isLunchOfficeSelected
                                                .value = true;
                                            billingController
                                                .isLunchHomeSelected
                                                .value = false;
                                            print(
                                                "check data ==> ${billingController.isLunchOfficeSelected.value}");
                                          },
                                          child: Obx(
                                            () => Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: billingController
                                                              .isLunchOfficeSelected
                                                              .value ==
                                                          true
                                                      ? appMainColor
                                                      : appMainColorLite,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Icon(Icons.location_city),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                height10,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          billingController
                                                  .tiffinTypeDinner.value =
                                              !billingController
                                                  .tiffinTypeDinner.value;
                                        },
                                        child: CustomRadioButton(
                                            buttonName: "Dinner",
                                            isSelected: billingController
                                                .tiffinTypeDinner)),
                                    width10,
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            await billingController
                                                .getTimeSlot(false);
                                            showTimeSlotePopUP(
                                                context,
                                                billingController
                                                    .getTimeSlotModel
                                                    .value
                                                    .timeslotList!,
                                                false);
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: primaryWhite,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 1,
                                                  blurRadius: 2,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Obx(
                                              () => Text(
                                                billingController
                                                    .selectedDinnerTime.value,
                                                style: AppTextStyle
                                                    .normalRegular14
                                                    .copyWith(
                                                        color: appMainColor,
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: appMainColor,
                                        ),
                                        width05,
                                        GestureDetector(
                                          onTap: () {
                                            billingController
                                                .isDinnerHomeSelected
                                                .value = true;
                                            billingController
                                                .isDinnerOfficeSelected
                                                .value = false;
                                          },
                                          child: Obx(
                                            () => Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: billingController
                                                              .isDinnerHomeSelected
                                                              .value ==
                                                          true
                                                      ? appMainColor
                                                      : appMainColorLite,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Icon(Icons.home),
                                            ),
                                          ),
                                        ),
                                        width05,
                                        GestureDetector(
                                          onTap: () {
                                            billingController
                                                .isDinnerHomeSelected
                                                .value = false;
                                            billingController
                                                .isDinnerOfficeSelected
                                                .value = true;
                                          },
                                          child: Obx(
                                            () => Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: billingController
                                                              .isDinnerOfficeSelected
                                                              .value ==
                                                          true
                                                      ? appMainColor
                                                      : appMainColorLite,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Icon(Icons.location_city),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            //! WEEKEND CHOICE
                            widget.fromType == 2
                                ? SizedBox()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      height20,
                                      HorizontalDottedLine(),
                                      height20,
                                      Text(
                                        "Weekend Choice",
                                        style: AppTextStyle.normalSemiBold22
                                            .copyWith(
                                                color: appMainColor,
                                                fontWeight: FontWeight.w400),
                                      ),
                                      height20,
                                      GestureDetector(
                                        onTap: () {
                                          billingController.onSaturday.value =
                                              !billingController
                                                  .onSaturday.value;
                                          billingController.getWeekendCount(
                                              double.parse(widget.weekendPrice
                                                  .toString()));
                                          billingController.getTotalCount(
                                              tiffinCount: widget.tiffinCount,
                                              tiffinPrice: widget.Price,
                                              ecoFriendly: billingController
                                                  .getpackagingDataModel
                                                  .value
                                                  .packagingList?[1]
                                                  .packagingPrice,
                                              regular: billingController
                                                  .getpackagingDataModel
                                                  .value
                                                  .packagingList?[0]
                                                  .packagingPrice);
                                          print(
                                              "Count check ==> ${billingController.count.toString()}");
                                        },
                                        child: CustomRadioButton(
                                            buttonName: "Saturday",
                                            isSelected:
                                                billingController.onSaturday),
                                      ),
                                      height10,
                                      GestureDetector(
                                          onTap: () {
                                            billingController.onSunday.value =
                                                !billingController
                                                    .onSunday.value;
                                            billingController.getWeekendCount(
                                                double.parse(widget.weekendPrice
                                                    .toString()));
                                            billingController.getTotalCount(
                                                tiffinCount: widget.tiffinCount,
                                                tiffinPrice: widget.Price,
                                                ecoFriendly: billingController
                                                    .getpackagingDataModel
                                                    .value
                                                    .packagingList?[1]
                                                    .packagingPrice,
                                                regular: billingController
                                                    .getpackagingDataModel
                                                    .value
                                                    .packagingList?[0]
                                                    .packagingPrice);
                                            print(
                                                "Count check ==> ${billingController.count.toString()}");
                                          },
                                          child: CustomRadioButton(
                                              buttonName: "Sunday",
                                              isSelected:
                                                  billingController.onSunday)),
                                    ],
                                  ),
                            //! DATE SELCETION
                            widget.fromType == 2
                                ? SizedBox()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      height20,
                                      HorizontalDottedLine(),
                                      height20,
                                      Text(
                                        "Start Date",
                                        style: AppTextStyle.normalSemiBold22
                                            .copyWith(
                                                color: appMainColor,
                                                fontWeight: FontWeight.w400),
                                      ),
                                      height20,
                                      GestureDetector(
                                        onTap: () {
                                          selectDate(context);
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.date_range_outlined,
                                              color: appMainColor,
                                            ),
                                            width15,
                                            Obx(
                                              () => Text(
                                                convertedDate.value,
                                                textAlign: TextAlign.start,
                                                style: AppTextStyle
                                                    .normalSemiBold18
                                                    .copyWith(
                                                        color: appMainColor,
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                            height20,
                            HorizontalDottedLine(),
                            height20,
                            Text(
                              "Packaging",
                              style: AppTextStyle.normalSemiBold22.copyWith(
                                  color: appMainColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            height20,
                            GestureDetector(
                              onTap: () {
                                billingController.ifRegularSelected();
                              },
                              child: Obx(
                                () => CustomRadioButton(
                                    buttonName:
                                        "${billingController.getpackagingDataModel.value.packagingList?[0].packagingName ?? ""}  \u{20B9}${billingController.getpackagingDataModel.value.packagingList?[0].packagingPrice ?? ""}",
                                    isSelected: billingController.packRagular),
                              ),
                            ),
                            height10,
                            GestureDetector(
                              onTap: () {
                                billingController.isEcoFriendly();
                              },
                              child: Obx(
                                () => CustomRadioButton(
                                    buttonName:
                                        "${billingController.getpackagingDataModel.value.packagingList?[1].packagingName ?? ""}  \u{20B9}${billingController.getpackagingDataModel.value.packagingList?[1].packagingPrice ?? ""}",
                                    isSelected:
                                        billingController.packEcoFrindly),
                              ),
                            ),
                            height20,
                            HorizontalDottedLine(),
                            height20,
                            Container(
                              width: Get.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Tiffin Price: ${widget.mrp}",
                                    style:
                                        AppTextStyle.normalRegular17.copyWith(
                                      color: appMainColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "Discount: ${int.parse(widget.mrp.toString()) - int.parse(widget.Price.toString())}",
                                    style: AppTextStyle.normalRegular17
                                        .copyWith(
                                            color: appMainColor,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  Obx(
                                    () => Text(
                                      "Packaging: ${billingController.packEcoFrindly.value == true ? "${int.parse(billingController.getpackagingDataModel.value.packagingList?[1].packagingPrice ?? "0") * 22}" : "${int.parse(billingController.getpackagingDataModel.value.packagingList?[0].packagingPrice ?? "0") * 22}"}",
                                      style: AppTextStyle.normalRegular17
                                          .copyWith(
                                              color: appMainColor,
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Text(
                                    "Dilivery: 0",
                                    style: AppTextStyle.normalRegular17
                                        .copyWith(
                                            color: appMainColor,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  Obx(() => billingController
                                                  .onSaturday.value ==
                                              true ||
                                          billingController.onSunday.value ==
                                              true
                                      ? Text(
                                          "Weekend Tiffins: ${billingController.count.toString()}",
                                          style: AppTextStyle.normalRegular17
                                              .copyWith(
                                                  color: appMainColor,
                                                  fontWeight: FontWeight.w400),
                                        )
                                      : SizedBox()),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: Get.width * 0.4,
                                        top: 10,
                                        bottom: 10),
                                    child: HorizontalDottedLine(),
                                  ),
                                  Obx(
                                    () => Text(
                                      "Sub Total: ${billingController.totalCount.value}",
                                      style: AppTextStyle.normalRegular17
                                          .copyWith(
                                              color: appMainColor,
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: Get.width * 0.4,
                                        top: 10,
                                        bottom: 10),
                                    child: HorizontalDottedLine(),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.5,
                                    child: textFormField(
                                      controller: null,
                                      filledColor:
                                          appMainColor.withOpacity(0.8),
                                      borderRaduis: 10,
                                      cursorColor: primaryWhite,
                                      hintText: "Coupen Code",
                                      hintStyle: AppTextStyle.normalBold14
                                          .copyWith(color: primaryWhite),
                                    ),
                                  ),
                                  height10,
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() =>
                                          ThankYouScreen(fromWhere: "Billing"));
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: Get.width * 0.5,
                                      decoration: BoxDecoration(
                                        color: primaryWhite,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        "Place Order",
                                        style: AppTextStyle.normalRegular17
                                            .copyWith(
                                                color: appMainColor,
                                                fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  height20,
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  DateTime? picked;
  DateTime selectedDate = DateTime.now();
  RxBool isSelected = false.obs;
  RxString convertedDate = "Tap to select Date".obs;
  Future<void> selectDate(BuildContext context) async {
    picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked!;
      convertedDate.value = DateFormat('yyyy-MM-dd').format(selectedDate);
      isSelected.value = true;
    }
  }
}
