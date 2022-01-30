import 'package:flutter_event_1/pressentation/resource/stringsManager.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  var index = 0;
  var selected = 0;
  var conditionSelected = 0;
  var conditionSelectedRed = 0;
  var dateSelected = 0;
  var dateSelectedRed = 0;
  var like = 0;
  var dislike = 0;

  var carName = {
    'Bmw': ['100,000 AED', false, AppStrings.bmw],
    'Mercides': ["50,000 AED", false, AppStrings.mercedes],
    'Audi': ["30,000 AED", false, AppStrings.audi],
    'Ford': ["20,000 AED", false, AppStrings.ford],
    'Jaguar': ["90,000 AED", false, AppStrings.jaguar],
    'Rangerover': ["50,000 AED", false, AppStrings.rangerover]
  };
  var date = {'2010-2012': '10 km', '2012-2013': "20 km", '2013-2014': "30 km"};
  var model = {'GCC': 'V6', 'GOP': "V8"};
  var type = {'Automatic': 'Pertol 95', 'Normal': "Pertol 95"};
  var condition = ["New/almost new", "Used"];
  var isSelected = false;
}
