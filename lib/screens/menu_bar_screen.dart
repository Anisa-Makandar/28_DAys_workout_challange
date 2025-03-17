import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drawer Header
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF2C67F2), // Blue Background
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.settings, color: Colors.white),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                          "assets/profile.jpg"), // Replace with actual image
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "User Name Here",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Current BMI  |  65 Kgs",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          // Settings Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Settings",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          // Settings List
          Expanded(
            child: ListView(
              children: [
                buildDrawerItem(Icons.history, "Workout History"),
                buildDrawerItem(Icons.favorite, "Favorite Exercises"),
                buildDrawerItem(Icons.schedule, "Schedule Workout"),
                buildDrawerItem(Icons.refresh, "Reset Progress"),
                buildDrawerItem(Icons.volume_up, "Volume"),
                buildDrawerItem(Icons.access_time, "Set Duration"),
                buildDrawerItem(Icons.notifications, "Notification",
                    trailing: Switch(value: true, onChanged: (v) {})),

                Divider(),

                // Others Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Others",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

                buildDrawerItem(Icons.store, "Store"),
                buildDrawerItem(Icons.star, "Rate Us"),
                buildDrawerItem(Icons.share, "Share the App"),
                buildDrawerItem(Icons.feedback, "Feedback"),
                buildDrawerItem(Icons.contact_mail, "Contact Us"),
                buildDrawerItem(Icons.privacy_tip, "Privacy Policy"),

                SizedBox(height: 20),

                // Bottom Text
                Center(
                  child: Column(
                    children: [
                      Text("Abs Workout",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.app_settings_alt, size: 14),
                          SizedBox(width: 4),
                          Text("App Version Code",
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Drawer Item Widget
  Widget buildDrawerItem(IconData icon, String title, {Widget? trailing}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: TextStyle(fontSize: 14)),
      trailing: trailing,
      onTap: () {},
    );
  }
}
