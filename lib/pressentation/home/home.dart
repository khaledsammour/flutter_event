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
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: AppMargin.m12),
                        height: MediaQuery.of(context).size.height * .25,
                        decoration: _carImage(),
                      ),
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
                                  child: Image.asset(AppStrings.bmw)),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .46,
                                  child: Image.asset(AppStrings.bmw)),
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
                            controller.conditionSelected = 0;
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
                                controller.conditionSelected == 0
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
                            controller.conditionSelected = 1;
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
                                controller.conditionSelected == 1
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
                    if (controller.dateSelected == 0) {
                      return;
                    } else {
                      controller.dateSelected = controller.dateSelected - 1;
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
                              controller.dateSelected == 0
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
                              controller.dateSelected == 1
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
                              controller.dateSelected == 2
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
                    if (controller.dateSelected == 2) {
                      return;
                    } else {
                      controller.dateSelected = controller.dateSelected + 1;
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
                    if (controller.index == 0) {
                      return;
                    } else {
                      controller.index = controller.index - 1;
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
                              controller.index == 3
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
                              controller.index == 4
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
                              controller.index == 5
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
                    if (controller.index == 5) {
                      return;
                    } else {
                      controller.index = controller.index + 1;
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
                    if (controller.index == 0) {
                      return;
                    } else {
                      controller.index = controller.index - 1;
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
                              controller.index == 0
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
                              controller.index == 1
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
                              controller.index == 2
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
                    if (controller.index == 5) {
                      return;
                    } else {
                      controller.index = controller.index + 1;
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
    return Row(
      children: [
        SizedBox(
          width: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  print("Compare is pressed");
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
                  print("Call is pressed");
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
                  print("Report is pressed");
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
              Container(
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
              Container(
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
              GestureDetector(
                onTap: () {
                  print("Request for advice is pressed");
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
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "?",
                          style: getBoldStyle(
                              color: ColorManager.whiteWithOpecity1,
                              fontSize: FontSize.s25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
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
  }

  _numberOfLike() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "1000",
          style:
              getNormalStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        ),
        Text(
          "1000",
          style:
              getNormalStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        ),
      ],
    );
  }

  _carImage() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
        image: const DecorationImage(
            image: AssetImage(AppStrings.bmw), fit: BoxFit.fill));
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
