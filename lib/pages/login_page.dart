import 'package:flutter/material.dart';
import 'package:online_shopping/pages/bottom_navigation_bar.dart';
import 'package:online_shopping/pages/signup_page.dart';
import 'package:online_shopping/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

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
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.05),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: screenWidth * 0.15,
                      backgroundImage: const AssetImage('assets/logo.jpg'),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.07,
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
                      padding: EdgeInsets.all(screenWidth * 0.05),
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
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  bool loginSuccess = await Provider.of<AuthProvider>(context, listen: false)
                                      .login(_emailController.text, _passwordController.text);
                                  if (loginSuccess) {
                                    Navigator.of(context).pushReplacementNamed(BottomNavigation.routeName);
                                  } else {
                                    Fluttertoast.showToast(msg: 'Invalid login credentials');
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: screenWidth * 0.05),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(SignupPage.routeName);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.teal,
                              ),
                              child: Text(
                                'Don\'t have an account? Sign up',
                                style: TextStyle(fontSize: screenWidth * 0.04),
                              ),
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
