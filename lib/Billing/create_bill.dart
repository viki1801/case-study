// create_bill_form.dart

import 'package:flutter/material.dart';


class CreateBillForm extends StatelessWidget {
  final TextEditingController billNameController;
  final TextEditingController billAmountController;
  final TextEditingController noteController;
  final Function(String, String, String) onGenerateBill;

  const CreateBillForm({
    required this.billNameController,
    required this.billAmountController,
    required this.noteController,
    required this.onGenerateBill,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: billNameController,
            decoration: InputDecoration(
              labelText: 'Bill Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 12),
          TextField(
            controller: billAmountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Bill Amount',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 12),
          TextField(
            controller: noteController,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'Note',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Call the provided callback to generate the bill
              String billName = billNameController.text.trim();
              String billAmount = billAmountController.text.trim();
              String note = noteController.text.trim();
              if (billName.isNotEmpty && billAmount.isNotEmpty && note.isNotEmpty) {
                onGenerateBill(billName, billAmount, note);
              } else {
                // Optionally show a message or handle empty inputs
              }
            },
            child: Text('Generate Bill',style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, // Background color of the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4), // Adjust the radius as needed
                ),
                elevation: 4
            ),
          ),
        ],
      ),
    );
  }
}
