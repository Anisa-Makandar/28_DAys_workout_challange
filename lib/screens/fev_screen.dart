import 'package:flutter/material.dart';

class FevScreen extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteWorkouts = List.generate(
    5,
    (index) => {
      "title": "High Plank",
      "icon": Icons.favorite, // Store the IconData instead of an Icon widget
      "image": "assets/images/male 1.png",
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF63A4FF), Color(0xFF2C67F2)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: Text(
          "Most Loved",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: favoriteWorkouts.length,
              itemBuilder: (context, index) {
                return _buildWorkoutCard(favoriteWorkouts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutCard(Map<String, dynamic> data) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: const Color(0xFFD8DEF8),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
          )
        ],
      ),
      child: Row(
        children: [
          Card(
            child: Container(
              height: 60,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: Center(
                child: Image.asset(
                  data["image"],
                  width: 55,
                  height: 55,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["title"],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                // Favorite Icon
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Icon(
                    data["icon"],
                    color: const Color(0xFFC31B0F),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
