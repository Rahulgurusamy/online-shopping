import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Order Shipped',
      'description': 'Your order #12345 has been shipped.',
      'timestamp': '2024-07-01 14:00',
    },
    {
      'title': 'New Promotion',
      'description': 'Get 20% off on your next purchase!',
      'timestamp': '2024-07-02 10:00',
    },
    {
      'title': 'Order Delivered',
      'description': 'Your order #12345 has been delivered.',
      'timestamp': '2024-07-03 16:00',
    },
  ];

  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final double padding = screenWidth * 0.04;
    final double titleFontSize = screenWidth * 0.05;
    final double subtitleFontSize = screenWidth * 0.04;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: padding, horizontal: padding),
            child: ListTile(
              title: Text(
                notification['title'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: titleFontSize,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  Text(notification['description']),
                  const SizedBox(height: 8.0),
                  Text(
                    notification['timestamp'],
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: subtitleFontSize,
                    ),
                  ),
                ],
              ),
              leading: Icon(
                Icons.notifications,
                color: Theme.of(context).primaryColor,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {},
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
