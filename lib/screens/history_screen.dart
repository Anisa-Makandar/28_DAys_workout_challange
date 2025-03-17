import 'package:flutter/material.dart';

class ActivityHistoryPage extends StatelessWidget {
  const ActivityHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160),
        child: _buildAppBar(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 250.0, top: 10),
            child: Column(
              children: [
                Image.asset("assets/images/filter 1.png",
                    height: 30, width: 30), // Adjust size as needed
                const SizedBox(height: 4), // Space between image and text
                const Text(
                  "Month",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const Text(
                  "December,2024",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildExerciseCard(
                    "Exercise Name Here", "29/12", "08:22", "00:30", "18"),
                _buildExerciseCard(
                    "Exercise Name Here", "30/12", "07:25", "00:30", "18"),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "January,2025",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
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

Widget _buildExerciseCard(
    String name, String date, String time, String duration, String kcal) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Card(
      color: const Color(0xFFD8DEF8), // Set background color directly
      elevation: 2, // Optional: Adds a shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
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
                            'assets/images/male 1.png',
                            width: 55,
                            height: 55,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "$date  $time",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      width:
                          150, // Set width to match text width or adjust as needed
                      height: 1, // Thickness of the divider
                      color: Colors.black, // Divider color
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            children: [
                              const Icon(Icons.access_time, color: Colors.blue),
                              const SizedBox(width: 4),
                              Center(child: Text("Time\n$duration")),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            children: [
                              const Icon(Icons.local_fire_department,
                                  color: Colors.blue),
                              const SizedBox(width: 4),
                              Center(child: Text("Kcal\n$kcal")),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            children: [
                              const Icon(Icons.delete, color: Colors.blue),
                              const SizedBox(width: 4),
                              Center(child: Text("Delete\n")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildAppBar() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xff55a2fa), Color(0xff2c67f2)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.arrow_back, color: Colors.white, size: 28),
            const SizedBox(width: 80),
            Center(
              child: const Text(
                'Activity History',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Profile Section
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: const [
                SizedBox(
                  height: 60,
                ),
                Icon(Icons.local_fire_department,
                    color: Colors.white, size: 24),
                SizedBox(height: 4),
                Text(
                  "Kcal 230",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white, // White border
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                  ),
                ),

                // User Name
                const Center(
                  child: Text(
                    "User Name here",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              children: const [
                SizedBox(
                  height: 60,
                ),
                Icon(Icons.access_time, color: Colors.white, size: 24),
                SizedBox(height: 4),
                Text(
                  "180 Min",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
