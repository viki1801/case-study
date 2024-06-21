// paid_bills_list.dart

import 'package:flutter/material.dart';
import '../Model/bill_model.dart';
import '../Provider/paid_bills_provider.dart'; // Import PaidBillsProvider
import 'package:provider/provider.dart';

class PaidBillsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paidBillsProvider = Provider.of<PaidBillsProvider>(context);
    final List<Bill> paidBills = paidBillsProvider.paidBills;

    return Scaffold(
      appBar: AppBar(
        title: Text('Paid Bills'),
      ),
      body: ListView.builder(
        itemCount: paidBills.length,
        itemBuilder: (context, index) {
          Bill bill = paidBills[index];
          return ListTile(
            title: Text('${bill.billName} - \$${bill.billAmount}'),
            subtitle: Text(bill.note),
          );
        },
      ),
    );
  }
}
