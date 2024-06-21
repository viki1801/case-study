// paid_bill_tile.dart

import 'package:flutter/material.dart';
import '../Model/bill_model.dart'; // Adjust the import path based on your project structure
import '../Provider/paid_bills_provider.dart'; // Import PaidBillsProvider
import 'package:provider/provider.dart'; // Import the custom PaidBillTile widget

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
          return PaidBillTile(
            billName: bill.billName,
            billAmount: bill.billAmount,
            note: bill.note,
          );
        },
      ),
    );
  }
}





class PaidBillTile extends StatelessWidget {
  final String billName;
  final String billAmount;
  final String note;

  const PaidBillTile({
    required this.billName,
    required this.billAmount,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple,
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(
          '$billName',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('\$ $billAmount', style: TextStyle(
              color: Colors.white
            ),),
            SizedBox(height: 4),
            Text(note, style: TextStyle(color: Colors.white),),
          ],
        ),
        trailing: Icon(Icons.payment, color: Colors.green),
      ),
    );
  }
}
