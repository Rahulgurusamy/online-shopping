import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final double padding = screenWidth * 0.05;
    final double titleFontSize = screenWidth * 0.05;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a payment method:',
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: Icon(
                Icons.credit_card,
                size: titleFontSize,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                'Credit Card',
                style: TextStyle(fontSize: titleFontSize),
              ),
              onTap: () {
                Navigator.pop(context, 'Credit Card');
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(
                Icons.account_balance_wallet,
                size: titleFontSize,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                'PayPal',
                style: TextStyle(fontSize: titleFontSize),
              ),
              onTap: () {
                Navigator.pop(context, 'PayPal');
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(
                Icons.money,
                size: titleFontSize,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                'Cash on Delivery',
                style: TextStyle(fontSize: titleFontSize),
              ),
              onTap: () {
                Navigator.pop(context, 'Cash on Delivery');
              },
            ),
          ],
        ),
      ),
    );
  }
}
