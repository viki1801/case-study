import 'package:flutter/material.dart';
import '../Model/bill_model.dart';
import 'billing_tile.dart';
import 'package:provider/provider.dart';
import '../Provider/paid_bills_provider.dart'; // Import PaidBillsProvider

class GeneratedBillsList extends StatefulWidget {
  final List<Bill> generatedBills;

  const GeneratedBillsList({Key? key, required this.generatedBills}) : super(key: key);

  @override
  _GeneratedBillsListState createState() => _GeneratedBillsListState();
}

class _GeneratedBillsListState extends State<GeneratedBillsList> {
  @override
  Widget build(BuildContext context) {
    final paidBillsProvider = Provider.of<PaidBillsProvider>(context, listen: false); // Obtain the PaidBillsProvider

    void moveToPaidBills(int index) {
      setState(() {
        paidBillsProvider.addPaidBill(widget.generatedBills[index]); // Add bill to paid bills using provider
        widget.generatedBills.removeAt(index);
      });
    }

    return ListView.builder(
      itemCount: widget.generatedBills.length,
      itemBuilder: (context, index) {
        Bill bill = widget.generatedBills[index];

        return GeneratedBillTile(
          billName: bill.billName,
          billAmount: bill.billAmount,
          note: bill.note,
          onPayPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Payment'),
                content: Text('Implement payment functionality here.\n\nClick on yes for assuming that payment is done!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      moveToPaidBills(index);
                    },
                    child: Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}