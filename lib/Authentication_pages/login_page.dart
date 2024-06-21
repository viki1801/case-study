import 'package:case_study/Authentication_pages/forgot_password_page.dart';
import 'package:case_study/home_page.dart';
import 'package:case_study/Authentication_pages/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text Editing Controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // login method
  final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  // Password visibility toggle
  bool isPasswordVisible = false;

  // create 2 sceond delay after the sucessfull log in
  bool isLoggingIn = false;

  Future<void> login(BuildContext context) async {
    // Check if email is valid
    if (!emailRegex.hasMatch(emailController.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email address.'),
          duration: Duration(seconds: 5),
        ),
      );
      return; // Exit the function if email is invalid
    }

    setState(() {
      isLoggingIn = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Navigate to the HomePage on successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Login failed. Please try again.';

      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(errorMessage),
          duration: const Duration(seconds: 5),
        ),
      );
      setState(() {
        isLoggingIn = false; // Set isLoggingIn to false on error
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Login failed. Please try again.'),
          duration: Duration(seconds: 5),
        ),
      );
      setState(() {
        isLoggingIn = false; // Set isLoggingIn to false on error
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.deepPurple, // Main background color
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.6, // Adjust the height as needed
              decoration: BoxDecoration(
                color: Colors.grey[200], // Light grey background
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0).copyWith(top: 75),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Log into your account',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white, // Inner white container
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          TextField(
                            decoration: const InputDecoration(
                              labelText: 'Enter the Email ID',
                            ),
                            controller: emailController,
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            obscureText: !isPasswordVisible,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            controller: passwordController,
                          ),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                  onPressed:(){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context)=> ForgotPasswordPage()));
                                  },
                                child: const Text('Forgot Password?',
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              login(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              minimumSize: const Size(double.infinity, 50),
                              // Full width, fixed height
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an Account?",
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.grey[500],
                          ),
                        ),

                        TextButton(
                          onPressed: () {
                            // Handle sign up
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=> SignUpPage()),
                            );
                          },child:
                            const Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.deepPurple,
                          ),
                        ),
                        ),
                      ],
                    ),
                   const SizedBox(height: 10,),
                   Center(child: isLoggingIn
                       ? const CircularProgressIndicator()
                       : const SizedBox()
                   ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}