// paid_bills_provider.dart

import 'package:flutter/material.dart';
import '../Model/bill_model.dart';

class PaidBillsProvider with ChangeNotifier {
  List<Bill> _paidBills = [];
  List<Bill> _generatedBills = [];

  List<Bill> get paidBills => _paidBills;
  List<Bill> get generatedBills => _generatedBills;

  void addGeneratedBill(Bill bill) {
    _generatedBills.add(bill);
    notifyListeners();
  }

  void addPaidBill(Bill bill) {
    _paidBills.add(bill);
    notifyListeners();
  }
}

// generated_bills_provider.dart


