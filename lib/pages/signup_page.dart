import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:online_shopping/providers/auth_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupPage extends StatefulWidget {
  static const routeName = '/signup';

  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _retypePasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double padding = screenWidth * 0.05;
    final double avatarRadius = screenWidth * 0.15;
    final double fontSizeTitle = screenWidth * 0.06;
    final double buttonFontSize = screenWidth * 0.05;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal.shade200, Colors.teal.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.1),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: avatarRadius,
                      backgroundImage: const AssetImage('assets/logo.jpg'),
                    ),
                  ),
                  Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSizeTitle,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 8.0,
                    child: Padding(
                      padding: EdgeInsets.all(padding),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _buildTextField(
                              controller: _emailController,
                              label: 'Email',
                              icon: Icons.email,
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            _buildTextField(
                              controller: _passwordController,
                              label: 'Password',
                              icon: Icons.lock,
                              obscureText: true,
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            _buildTextField(
                              controller: _retypePasswordController,
                              label: 'Retype Password',
                              icon: Icons.lock,
                              obscureText: true,
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            _buildTextField(
                              controller: _phoneController,
                              label: 'Phone Number',
                              icon: Icons.phone,
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  bool signupSuccess = await Provider.of<AuthProvider>(context, listen: false)
                                      .signup(_emailController.text, _passwordController.text, _phoneController.text);
                                  if (signupSuccess) {
                                    Fluttertoast.showToast(msg: 'You have successfully Signup, please login');
                                    Navigator.of(context).pop();
                                  } else {
                                    Fluttertoast.showToast(msg: 'Signup failed, please try again');
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                textStyle: TextStyle(fontSize: buttonFontSize),
                              ),
                              child: const Text('Sign Up'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.teal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      },
    );
  }
}
