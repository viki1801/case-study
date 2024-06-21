// billing_tile.dart

import 'package:flutter/material.dart';

class GeneratedBillTile extends StatelessWidget {
  final String billName;
  final String billAmount;
  final String note;
  final VoidCallback onPayPressed;

  const GeneratedBillTile({
    required this.billName,
    required this.billAmount,
    required this.note,
    required this.onPayPressed,
  });

  @override

  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Name: $billName',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Amount: $billAmount',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Note: $note',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: onPayPressed,
              child: Text('Pay'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                elevation: MaterialStateProperty.all(4),
                shadowColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
