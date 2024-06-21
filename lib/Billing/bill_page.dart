import 'package:flutter/material.dart';
import 'create_bill.dart';
import 'genrated_bill.dart'; // Assuming this file contains GeneratedBillsList and GeneratedBillTile
import '../Model/bill_model.dart'; // Import Bill class

class BillPage extends StatefulWidget {
  const BillPage({Key? key}) : super(key: key);

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Bill> generatedBills = []; // List to store generated bills as Bill objects

  TextEditingController _billNameController = TextEditingController();
  TextEditingController _billAmountController = TextEditingController();
  TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _billNameController.dispose();
    _billAmountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _generateBill(String billName, String billAmount, String note) {
    setState(() {
      // Create a new Bill object and add it to the list
      Bill newBill = Bill(
        billName: billName,
        billAmount: billAmount,
        note: note,
      );
      generatedBills.add(newBill);

      // Clear text fields after generating the bill
      _billNameController.clear();
      _billAmountController.clear();
      _noteController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bills'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Create Bill'),
            Tab(text: 'Generated Bills'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // First tab view: Create Bill
          CreateBillForm(
            billNameController: _billNameController,
            billAmountController: _billAmountController,
            noteController: _noteController,
            onGenerateBill: _generateBill,
          ),
          // Second tab view: Generated Bills
          GeneratedBillsList(generatedBills: generatedBills),
        ],
      ),
    );
  }
}
