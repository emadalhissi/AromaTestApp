import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/no_data.png'),
              width: 280,
              height: 280,
            ),
            SizedBox(height: 20,),
            Text(
              'NO DATA',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
