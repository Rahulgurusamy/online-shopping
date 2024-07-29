import 'package:flutter/material.dart';
import 'package:online_shopping/pages/about_us.dart';
import 'package:online_shopping/pages/address_page.dart';
import 'package:online_shopping/pages/change_password.dart';
import 'package:online_shopping/pages/help_center.dart';
import 'package:online_shopping/pages/login_page.dart';
import 'package:online_shopping/pages/notification_page.dart';
import 'package:online_shopping/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.05;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: padding),
        children: [
          _buildProfileCard(context),
          _buildListTile(
            context,
            icon: Icons.lock,
            title: 'Change Password',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChangePasswordPage(),
                ),
              );
            },
          ),
          _buildListTile(
            context,
            icon: Icons.location_on,
            title: 'Your Address',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddressPage(),
                ),
              );
            },
          ),
          _buildListTile(
            context,
            icon: Icons.help,
            title: 'Help Center',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelpCenterPage(),
                ),
              );
            },
          ),
          _buildListTile(
            context,
            icon: Icons.notifications,
            title: 'Notification Page',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationPage(),
                ),
              );
            },
          ),
          _buildListTile(
            context,
            icon: Icons.info,
            title: 'About Us',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUsPage(),
                ),
              );
            },
          ),
          _buildListTile(
            context,
            icon: Icons.exit_to_app,
            title: 'Logout',
            onTap: () {
              _showLogoutConfirmationDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = Provider.of<AuthProvider>(context).user;

    return Card(
      margin: EdgeInsets.all(size.width * 0.04),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.04),
        child: Row(
          children: [
            CircleAvatar(
              radius: size.width * 0.1,
              backgroundImage: NetworkImage(user.image),
            ),
            SizedBox(width: size.width * 0.04),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap}) {
    final size = MediaQuery.of(context).size;

    return Card(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: size.width * 0.04),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(
          title,
          style: TextStyle(
            fontSize: size.width * 0.045,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.teal),
        onTap: onTap,
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text('Confirm Logout', style: TextStyle(color: Colors.teal)),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              child: const Text('No', style: TextStyle(color: Colors.teal)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes', style: TextStyle(color: Colors.red)),
              onPressed: () async {
                await Provider.of<AuthProvider>(context, listen: false).logout();
                Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
              },
            ),
          ],
        );
      },
    );
  }
}
