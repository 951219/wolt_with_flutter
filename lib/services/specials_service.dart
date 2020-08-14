import 'package:wolt_with_flutter/datamodels/restaurant_object.dart';
import 'package:wolt_with_flutter/datamodels/special_object.dart';

class SpecialsService {
  List<SpecialObject> specialsList = [];

  List<SpecialObject> getSpecials() {
    return specialsList;
  }
}
