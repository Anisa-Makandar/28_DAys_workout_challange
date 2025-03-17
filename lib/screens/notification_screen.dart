import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "icon": "🔔",
      "title": "Hey, it's time for lunch",
      "time": "About 1 minutes ago"
    },
    {
      "icon": "🔔",
      "title": "Don't miss your Abs workout",
      "time": "About 3 hours ago"
    },
    {
      "icon": "🔔",
      "title": "Hey, it's time for dinner",
      "time": "About 3 hours ago"
    },
    {
      "icon": "⏰",
      "title": "Congratulations, You have finished A...",
      "time": "29 May"
    },
    {"icon": "⏰", "title": "Hey, it's time for lunch", "time": "8 April"},
    {
      "icon": "⏰",
      "title": "Ups, You have missed your ab...",
      "time": "3 April"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: const Color(0xFF2C67F2)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Notification",
            style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: const Color(0xFF000000)),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16, bottom: 80, top: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15) // Provide a valid radius value
                ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: notifications.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(
                  notifications[index]["icon"]!,
                  style: const TextStyle(fontSize: 24),
                ),
                title: Text(
                  notifications[index]["title"]!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  notifications[index]["time"]!,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                trailing: const Icon(Icons.more_vert),
              );
            },
          ),
        ),
      ),
    );
  }
}
