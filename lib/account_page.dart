import 'package:case_study/change_password_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    Future<void> deleteAccount(BuildContext context) async {
      try {
        // Confirm deletion with the user
        bool confirm = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Delete Account'),
            content: Text('Are you sure you want to delete your account? This action cannot be undone.'),
            actions: [
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: Text('Delete'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          ),
        );

        if (!confirm) return;

        // Delete user data from Firestore
        await FirebaseFirestore.instance.collection('users').doc(user!.uid).delete();

        // Delete user authentication record
        await user.delete();

        // Sign out the user
        await FirebaseAuth.instance.signOut();

        // Navigate to login or home page after deletion
        Navigator.of(context).pushReplacementNamed('/login');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to delete account: $e'),
        ));
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Account'),
      ),
      body: Center(
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('users').doc(user!.uid).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (!snapshot.hasData || snapshot.data!.data() == null) {
              return Text('No data found');
            }

            Map<String, dynamic> userData = snapshot.data!.data() as Map<String, dynamic>;

            return Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: userData.containsKey('profileImageUrl')
                            ? NetworkImage(userData['profileImageUrl'])
                            : null,
                        child: !userData.containsKey('profileImageUrl')
                            ? Icon(Icons.account_circle, size: 50, color: Colors.grey[800])
                            : null,
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${userData['firstName']} ${userData['lastName']}' ?? '',
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            userData['email'] ?? '',
                            style: const TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Change Password'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.delete, color: Colors.red),
                  title: Text('Delete Account'),
                  onTap: () => deleteAccount(context),
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    // Navigate to login page or home page
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
