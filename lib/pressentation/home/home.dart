import 'package:flutter/material.dart';
import 'package:flutter_event_1/pressentation/home/homeViewModel.dart';
import 'package:flutter_event_1/pressentation/resource/colorManager.dart';
import 'package:flutter_event_1/pressentation/resource/stringsManager.dart';
import 'package:flutter_event_1/pressentation/resource/stylesManager.dart';
import 'package:flutter_event_1/pressentation/resource/valuesManager.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: _bottom(),
        ),
        elevation: 10,
        title: SizedBox(
          width: 140,
          child: Image.asset(
            AppStrings.title,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppPadding.p8),
            child: SizedBox(width: 50, child: Image.asset(AppStrings.wheel)),
          )
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: GetBuilder<HomeViewModel>(
            init: HomeViewModel(),
            builder: (controller) {
              return Builder(builder: (context) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .07,
                          child: _carName()),
                      _carImage(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .19,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _carDescription(),
                            const SizedBox(
                              width: 30,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * .4,
                                child: _buttons()),
                            SizedBox(
                                height: 50, width: 35, child: _numberOfLike())
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .04,
                        child: Text(
                          "Search other Cars",
                          style: getNormalStyle(
                              color: ColorManager.grey, fontSize: FontSize.s25),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .05,
                        color: ColorManager.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(AppStrings.filter),
                            GestureDetector(
                                onTap: () {
                                  controller.isSelected
                                      ? controller.isSelected = false
                                      : controller.isSelected = true;
                                  controller.index = controller.selected;
                                  controller.conditionSelected =
                                      controller.conditionSelectedRed;
                                  controller.dateSelected =
                                      controller.dateSelectedRed;
                                  controller.update();
                                },
                                child: Image.asset(AppStrings.filterMenu))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      controller.isSelected
                          ? Container(
                              height: MediaQuery.of(context).size.height * .43,
                              color: ColorManager.blue,
                              child: Padding(
                                padding: const EdgeInsets.all(AppMargin.m12),
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .09,
                                        child: _filterCarName1()),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .01,
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .09,
                                        child: _filterCarName2()),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .01,
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .09,
                                        child: _filterDate()),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .01,
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .09,
                                        child: _filtertype()),
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              height: 0,
                            ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Container(
                        color: ColorManager.grey,
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .16,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .46,
                                  child: Image.asset(controller.carName.entries
                                      .toList()[controller.index]
                                      .value
                                      .elementAt(2)
                                      .toString())),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .46,
                                  child: Image.asset(controller.carName.entries
                                      .toList()[controller.index]
                                      .value
                                      .elementAt(2)
                                      .toString())),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                    ],
                  ),
                );
              });
            }),
      ),
    );
  }

  _filtertype() {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) {
          return Builder(builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .76,
                  decoration: BoxDecoration(
                      color: ColorManager.whiteWithOpecity1,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.conditionSelectedRed = 0;
                            controller.update();
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.condition[0],
                                  style: getBoldStyle(
                                      color: ColorManager.black,
                                      fontSize: FontSize.s16),
                                ),
                                controller.conditionSelectedRed == 0
                                    ? Container(
                                        height: 3,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .3,
                                        color: ColorManager.red,
                                      )
                                    : Container(
                                        height: 0,
                                      )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.conditionSelectedRed = 1;
                            controller.update();
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.condition[1],
                                  style: getBoldStyle(
                                      color: ColorManager.black,
                                      fontSize: FontSize.s18),
                                ),
                                controller.conditionSelectedRed == 1
                                    ? Container(
                                        height: 3,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .2,
                                        color: ColorManager.red,
                                      )
                                    : Container(
                                        height: 0,
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          });
        });
  }

  _filterDate() {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) {
          return Builder(builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (controller.dateSelectedRed == 0) {
                      return;
                    } else {
                      controller.dateSelectedRed =
                          controller.dateSelectedRed - 1;
                      controller.update();
                    }
                  },
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * .07,
                      width: MediaQuery.of(context).size.width * .08,
                      child: Image.asset(
                        AppStrings.leftArrow,
                        fit: BoxFit.fill,
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .76,
                  decoration: BoxDecoration(
                      color: ColorManager.whiteWithOpecity1,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.date.entries.toList()[0].key,
                                style: getBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s16),
                              ),
                              controller.dateSelectedRed == 0
                                  ? Container(
                                      height: 3,
                                      width: MediaQuery.of(context).size.width *
                                          .2,
                                      color: ColorManager.red,
                                    )
                                  : Container(
                                      height: 0,
                                    )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.date.entries.toList()[1].key,
                                style: getBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s16),
                              ),
                              controller.dateSelectedRed == 1
                                  ? Container(
                                      height: 3,
                                      width: MediaQuery.of(context).size.width *
                                          .2,
                                      color: ColorManager.red,
                                    )
                                  : Container(
                                      height: 0,
                                    )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.date.entries.toList()[2].key,
                                style: getBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s16),
                              ),
                              controller.dateSelectedRed == 2
                                  ? Container(
                                      height: 3,
                                      width: MediaQuery.of(context).size.width *
                                          .2,
                                      color: ColorManager.red,
                                    )
                                  : Container(
                                      height: 0,
                                    )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.dateSelectedRed == 2) {
                      return;
                    } else {
                      controller.dateSelectedRed =
                          controller.dateSelectedRed + 1;
                      controller.update();
                    }
                  },
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * .07,
                      width: MediaQuery.of(context).size.width * .08,
                      child: Image.asset(
                        AppStrings.rightArrow,
                        fit: BoxFit.fill,
                      )),
                ),
              ],
            );
          });
        });
  }

  _filterCarName2() {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) {
          return Builder(builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (controller.selected == 0) {
                      return;
                    } else {
                      controller.selected = controller.selected - 1;
                      controller.update();
                    }
                  },
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * .07,
                      width: MediaQuery.of(context).size.width * .08,
                      child: Image.asset(
                        AppStrings.leftArrow,
                        fit: BoxFit.fill,
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .76,
                  decoration: BoxDecoration(
                      color: ColorManager.whiteWithOpecity1,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.carName.entries.toList()[3].key,
                                style: getBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s18),
                              ),
                              controller.selected == 3
                                  ? Container(
                                      height: 3,
                                      width: MediaQuery.of(context).size.width *
                                          .2,
                                      color: ColorManager.red,
                                    )
                                  : Container(
                                      height: 0,
                                    )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.carName.entries.toList()[4].key,
                                style: getBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s18),
                              ),
                              controller.selected == 4
                                  ? Container(
                                      height: 3,
                                      width: MediaQuery.of(context).size.width *
                                          .2,
                                      color: ColorManager.red,
                                    )
                                  : Container(
                                      height: 0,
                                    )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.carName.entries.toList()[5].key,
                                style: getBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s14),
                              ),
                              controller.selected == 5
                                  ? Container(
                                      height: 3,
                                      width: MediaQuery.of(context).size.width *
                                          .2,
                                      color: ColorManager.red,
                                    )
                                  : Container(
                                      height: 0,
                                    )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.selected == 5) {
                      return;
                    } else {
                      controller.selected = controller.selected + 1;
                      controller.update();
                    }
                  },
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * .07,
                      width: MediaQuery.of(context).size.width * .08,
                      child: Image.asset(
                        AppStrings.rightArrow,
                        fit: BoxFit.fill,
                      )),
                ),
              ],
            );
          });
        });
  }

  _filterCarName1() {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) {
          return Builder(builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (controller.selected == 0) {
                      return;
                    } else {
                      controller.selected = controller.selected - 1;
                      controller.update();
                    }
                  },
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * .07,
                      width: MediaQuery.of(context).size.width * .08,
                      child: Image.asset(
                        AppStrings.leftArrow,
                        fit: BoxFit.fill,
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .76,
                  decoration: BoxDecoration(
                      color: ColorManager.whiteWithOpecity1,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.carName.entries.toList()[0].key,
                                style: getBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s18),
                              ),
                              controller.selected == 0
                                  ? Container(
                                      height: 3,
                                      width: MediaQuery.of(context).size.width *
                                          .2,
                                      color: ColorManager.red,
                                    )
                                  : Container(
                                      height: 0,
                                    )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.carName.entries.toList()[1].key,
                                style: getBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s18),
                              ),
                              controller.selected == 1
                                  ? Container(
                                      height: 3,
                                      width: MediaQuery.of(context).size.width *
                                          .2,
                                      color: ColorManager.red,
                                    )
                                  : Container(
                                      height: 0,
                                    )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.carName.entries.toList()[2].key,
                                style: getBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s18),
                              ),
                              controller.selected == 2
                                  ? Container(
                                      height: 3,
                                      width: MediaQuery.of(context).size.width *
                                          .2,
                                      color: ColorManager.red,
                                    )
                                  : Container(
                                      height: 0,
                                    )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.selected == 5) {
                      return;
                    } else {
                      controller.selected = controller.selected + 1;
                      controller.update();
                    }
                  },
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * .07,
                      width: MediaQuery.of(context).size.width * .08,
                      child: Image.asset(
                        AppStrings.rightArrow,
                        fit: BoxFit.fill,
                      )),
                ),
              ],
            );
          });
        });
  }

  _carDescription() {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) {
          return Builder(builder: (context) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * .44,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .18,
                          child: Text(
                            controller.carName.entries
                                .toList()[controller.index]
                                .key,
                            style: getNormalStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s12),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .20,
                          child: Text(
                            controller.carName.entries
                                .toList()[controller.index]
                                .value
                                .elementAt(0)
                                .toString(),
                            style: TextStyle(
                                color: ColorManager.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 3,
                    color: ColorManager.grey,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.date.entries
                              .toList()[controller.dateSelected]
                              .key,
                        ),
                        Text(
                          controller.date.entries
                              .toList()[controller.dateSelected]
                              .value,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 3,
                    color: ColorManager.grey,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.model.entries.toList()[0].key,
                        ),
                        Text(
                          controller.model.entries.toList()[0].value,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 3,
                    color: ColorManager.grey,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.type.entries.toList()[0].key,
                        ),
                        Text(
                          controller.type.entries.toList()[0].value,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 3,
                    color: ColorManager.grey,
                  ),
                ],
              ),
            );
          });
        });
  }

  _buttons() {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) {
          return Row(
            children: [
              SizedBox(
                width: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.snackbar("tapped", "Compare is pressed");
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            "  ؟\nCompare",
                            style: getBoldStyle(color: ColorManager.black),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.snackbar("tapped", "Call is pressed");
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorManager.blue,
                        ),
                        child: Center(
                          child: Text(
                            "Call",
                            style: getBoldStyle(
                                color: ColorManager.whiteWithOpecity1,
                                fontSize: FontSize.s20),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.snackbar("tapped", "Report is pressed");
                      },
                      child: Container(
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorManager.grey,
                        ),
                        child: Center(
                          child: Text(
                            "Report !",
                            style: getBoldStyle(
                                color: ColorManager.whiteWithOpecity1,
                                fontSize: FontSize.s14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.like = controller.like + 1;
                        controller.update();
                      },
                      child: Container(
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorManager.red,
                        ),
                        child: Center(
                          child: Text(
                            "Like",
                            style: getBoldStyle(
                                color: ColorManager.whiteWithOpecity1,
                                fontSize: FontSize.s20),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.dislike = controller.dislike + 1;
                        controller.update();
                      },
                      child: Container(
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorManager.red,
                        ),
                        child: Center(
                          child: Text(
                            "Dislike",
                            style: getBoldStyle(
                                color: ColorManager.whiteWithOpecity1,
                                fontSize: FontSize.s16),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.snackbar("tapped", "Request for advice is pressed");
                      },
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "?",
                                style: getBoldStyle(
                                    color: ColorManager.whiteWithOpecity1,
                                    fontSize: FontSize.s25),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "Request\nfor advice",
                                style: getBoldStyle(
                                    color: ColorManager.whiteWithOpecity1,
                                    fontSize: FontSize.s14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  _numberOfLike() {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.like.toString(),
                style: getNormalStyle(
                    color: ColorManager.grey, fontSize: FontSize.s14),
              ),
              Text(
                controller.dislike.toString(),
                style: getNormalStyle(
                    color: ColorManager.grey, fontSize: FontSize.s14),
              ),
            ],
          );
        });
  }

  _carImage() {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) {
          return Builder(builder: (context) {
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: AppMargin.m12),
                height: MediaQuery.of(context).size.height * .25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage(controller.carName.entries
                            .toList()[controller.index]
                            .value
                            .elementAt(2)
                            .toString()),
                        fit: BoxFit.fill)));
          });
        });
  }

  _carName() {
    return Padding(
      padding: const EdgeInsets.only(right: AppPadding.p12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: AppPadding.p20),
            child: Text(
              "ABBBB CARS",
              style: getNormalStyle(
                  color: ColorManager.blue, fontSize: FontSize.s30),
            ),
          ),
          SizedBox(
              height: AppSize.s40,
              width: AppSize.s60,
              child: Image.asset(
                AppStrings.back,
                fit: BoxFit.fill,
              ))
        ],
      ),
    );
  }

  _bottom() {
    return Column(
      children: [
        Container(
          height: 5,
          color: ColorManager.blue,
        ),
        const SizedBox(
          height: 1,
        ),
        Container(
          margin: EdgeInsets.only(right: AppMargin.m8),
          alignment: Alignment.topRight,
          height: 30,
          child: Image.asset(AppStrings.menu),
        ),
        const SizedBox(
          height: 1,
        ),
        Container(
          height: 5,
          color: ColorManager.blue,
        ),
      ],
    );
  }
}
