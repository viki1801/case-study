import 'dart:convert';

import 'package:case_study/Model/bill_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveGeneratedBills(List<Bill> generatedBills) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> billsJsonList =
  generatedBills.map((bill) => json.encode(bill.toJson())).toList();
  await prefs.setStringList('generatedBills', billsJsonList);
}

Future<List<Bill>> loadGeneratedBills() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? billsJsonList = prefs.getStringList('generatedBills');
  if (billsJsonList == null) {
    return [];
  }
  return billsJsonList.map((jsonString) => Bill.fromJson(json.decode(jsonString))).toList();
}