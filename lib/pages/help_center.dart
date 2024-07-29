import 'package:flutter/material.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final double padding = screenSize.width * 0.05;
    final double fontSizeTitle = isPortrait ? 24 : 20;
    final double fontSizeBody = isPortrait ? 16 : 14;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Icon(Icons.help_outline, size: screenSize.width * 0.2, color: Colors.teal),
                  Text(
                    'How can we assist you?',
                    style: TextStyle(fontSize: fontSizeTitle, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: padding / 2),
                  Text(
                    'We are here to help you with any issues or questions you may have.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: fontSizeBody, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: padding),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 5,
              child: ExpansionTile(
                title: Text('FAQs', style: TextStyle(fontSize: fontSizeTitle)),
                leading: const Icon(Icons.question_answer, color: Colors.teal),
                children: [
                  ListTile(
                    title: Text('How to use this app?', style: TextStyle(fontSize: fontSizeBody)),
                    subtitle: const Text('Step-by-step instructions on how to use the app.'),
                  ),
                  ListTile(
                    title: Text('How to reset my password?', style: TextStyle(fontSize: fontSizeBody)),
                    subtitle: const Text('Instructions to reset your password.'),
                  ),
                ],
              ),
            ),
            SizedBox(height: padding),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 5,
              child: ListTile(
                title: Text('Contact Support', style: TextStyle(fontSize: fontSizeBody)),
                leading: const Icon(Icons.contact_support, color: Colors.teal),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      title: const Text('Contact Support', style: TextStyle(color: Colors.teal)),
                      content: const Text('For support, please email us at support@example.com'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: padding),
            Text(
              'Give us your feedback',
              style: TextStyle(fontSize: fontSizeTitle, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: padding / 2),
            Text(
              'We would love to hear from you! Please fill out the form below to provide your feedback.',
              style: TextStyle(fontSize: fontSizeBody),
            ),
            SizedBox(height: padding),
            _FeedbackForm(padding: padding, fontSize: fontSizeBody),
          ],
        ),
      ),
    );
  }
}

class _FeedbackForm extends StatefulWidget {
  final double padding;
  final double fontSize;

  const _FeedbackForm({required this.padding, required this.fontSize});

  @override
  __FeedbackFormState createState() => __FeedbackFormState();
}

class __FeedbackFormState extends State<_FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(widget.padding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(fontSize: widget.fontSize),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: widget.padding / 2),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: widget.fontSize),
                validator: (value) {
                  if (value == null || value.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: widget.padding / 2),
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                style: TextStyle(fontSize: widget.fontSize),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your feedback';
                  }
                  return null;
                },
              ),
              SizedBox(height: widget.padding),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Feedback submitted')),
                    );
                    _nameController.clear();
                    _emailController.clear();
                    _messageController.clear();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(widget.padding / 2),
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
