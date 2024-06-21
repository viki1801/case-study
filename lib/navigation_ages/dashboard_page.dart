import 'package:case_study/Billing/bill_page.dart';
import 'package:case_study/paid_bill_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../account_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String _profileImageUrl = '';
  String _firstName = '';

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (doc.exists) {
        setState(() {
          _profileImageUrl = doc['profileImageUrl'];
          _firstName = doc['firstName'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.deepPurple,
          //height: screenHeight,
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.2,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: screenWidth * 0.15,
                          backgroundImage: _profileImageUrl.isNotEmpty
                              ? NetworkImage(_profileImageUrl)
                              : null,
                          backgroundColor: Colors.grey[300],
                          child: _profileImageUrl.isEmpty
                              ? const CircularProgressIndicator()
                              : null,
                        ),
                        SizedBox(width: screenWidth * 0.04),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.04),
                            ),
                            Text(
                              _firstName.isNotEmpty ? _firstName : 'User',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow
                                  .ellipsis, // This adds "..." if the text overflows
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //Spacer(),
              SizedBox(height: screenHeight * 0.04),
              Container(
                // height: screenHeight,
                padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenHeight * 0.03),
                    topRight: Radius.circular(screenHeight * 0.03),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: screenHeight * 0.002,
                      blurRadius: screenHeight * 0.005,
                      offset: Offset(
                          0, screenHeight * 0.003), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.4,
                          vertical: screenHeight * 0.02),
                      child: Divider(
                        color: Colors
                            .black, // Black line separator above "Quick Actions"
                        thickness: screenHeight * 0.005,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenHeight * 0.02),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Quick Actions',
                          style: TextStyle(
                              fontSize: screenHeight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        childAspectRatio: 1,
                        children: [
                          _buildQuickAction(
                              icon: Icons.receipt, label: 'Bills',
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> BillPage()),);
                              }
                            ),
                          _buildQuickAction(
                              icon: Icons.link_off, label: 'Disconnect',onTap: (){}),
                          _buildQuickAction(
                              icon: Icons.swap_horiz, label: 'Transfer',onTap: (){}),
                          _buildQuickAction(
                              icon: Icons.miscellaneous_services,
                              label: 'Services',onTap: (){}),
                          _buildQuickAction(
                              icon: Icons.feedback, label: 'Complain',onTap: (){}),
                          _buildQuickAction(icon: Icons.update, label: 'Update',onTap: (){}),
                          _buildQuickAction(
                              icon: Icons.connect_without_contact,
                              label: 'Connect',onTap: (){}),
                          _buildQuickAction(
                              icon: Icons.power_off, label: 'Outage',onTap: (){}),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Divider(
                      color: Colors.grey.withOpacity(0.2), // Faint shade of grey
                      thickness: screenHeight * 0.01,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      child: Row(
                        children: [
                          Text(
                            'Gas | ',
                            style: TextStyle(
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'SA1234567',
                            style: TextStyle(
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple),
                          ),
                          Spacer(),
                          Text(
                            'Last Month',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: screenHeight * 0.015),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding: EdgeInsets.only(
                          right: screenHeight * 0.02, left: screenHeight * 0.02),
                      child: Container(
                        padding: EdgeInsets.all(
                            screenHeight * 0.02), // Added padding from all sides
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.005),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius:
                                  screenHeight * 0.005, // Increased spread radius
                              blurRadius:
                                  screenHeight * 0.01, // Increased blur radius
                              offset: Offset(
                                  0, screenHeight * 0.005), // Adjusted offset
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PaidBillsList()),
                                );
                              },
                              child: SizedBox(
                                //height: screenHeight * 0.05,
                                child: ListTile(
                                  leading: Icon(
                                    Icons.receipt,
                                    color: Colors.deepPurple,
                                    size: screenHeight * 0.05,
                                  ),
                                  title: Text(
                                    'Bills',
                                    style: TextStyle(fontSize: screenHeight * 0.02),
                                  ),
                                  subtitle: Text(
                                    '20 Jan 2020',
                                    style: TextStyle(color: Colors.grey, fontSize: screenHeight * 0.015),
                                  ),

                                  trailing: Text(
                                    '43\$',
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenHeight * 0.030,
                                    ),
                                  ),
                                ),
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.06),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAction({required IconData icon, required String label,  required VoidCallback onTap, }) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
            child: Icon(icon,
                size: screenHeight * 0.04, color: Colors.deepPurple)),
        SizedBox(height: screenHeight * 0.01),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: screenHeight * 0.015, color: Colors.black),
        ),
      ],
    );
  }
}
