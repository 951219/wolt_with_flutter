library constants;

import 'package:flutter/material.dart';
import 'package:wolt_with_flutter/datamodels/user_location.dart';
import 'datamodels/category_object.dart';

const EdgeInsets PADDING_LTRB = EdgeInsets.fromLTRB(20, 10, 20, 10);
const EdgeInsets PADDING_FOR_QUICKLINKS = EdgeInsets.fromLTRB(5, 15, 0, 0);
const bool PULL_DATA_FROM_WEB = false;
const TextStyle TITLE_STYLE =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);

Future<UserLocation> userLocation;

Future<List<CategoryObject>> categories;
