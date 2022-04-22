import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:untitled/src/admin_mobile_sample/model/name_obj.dart';

class ProviderNameState extends ChangeNotifier {
  ProviderNameState() : obj = NameObj();
  NameObj obj;

  void addName(name) {
  }
}