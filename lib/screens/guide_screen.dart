import 'package:flutter/material.dart';

class WorkoutGuideScreen extends StatefulWidget {
  @override
  _WorkoutGuideScreenState createState() => _WorkoutGuideScreenState();
}

class _WorkoutGuideScreenState extends State<WorkoutGuideScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
          title: Text("GUIDE",
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.volume_up, color: const Color(0xFF2C67F2)),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    // Container for the Image
                    Container(
                      height: 120,
                      width: 75,
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/female 1.png",
                          width: 75,
                          height: 70,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align text properly
                        children: [
                          // Centering the title
                          Center(
                            child: Text(
                              "“HIGH KNEES”",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center, // Centers the text
                            ),
                          ),
                          SizedBox(height: 5),

                          // Wrapped Description Text
                          Text(
                            "High knees improve cardio, strengthen legs, core, and boost agility.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign
                                .left, // Left-aligns for better readability
                            softWrap: true, // Ensures text wraps properly
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 5, horizontal: 12.0), // Adds space around divider
                child: Divider(
                  color: Colors.grey, // Change color as needed
                  thickness: 1, // Adjust thickness
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Card(
                  elevation: 3, // Gives a slight shadow effect
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    width: double.infinity, // Expands to full width
                    padding:
                        EdgeInsets.all(12), // Adds padding inside the container
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color for card
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "To do jumping jacks:",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "1. Start by standing tall with your feet together and arms resting at your sides.\n"
                          "2. Jump your feet outward to about shoulder width while raising your arms overhead, keeping your body in a straight line.\n"
                          "3. Quickly jump back to the starting position, bringing your feet together and lowering your arms back to your sides.\n"
                          "4. Continue this motion, maintaining a steady rhythm.",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2C67F2), Color(0xFF55A2FA)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                padding: EdgeInsets.only(left: 5, right: 5, top: 20),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LET’S DO THIS!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "“HIGH KNEES”",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12),

                    // Circular Countdown Timer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Left Pause Icon
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: IconButton(
                            icon: Icon(Icons.pause_circle_filled,
                                color: Colors.white, size: 32),
                            onPressed: () {}, // Pause action
                          ),
                        ),

                        // Circular Timer in Center
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: CircularProgressIndicator(
                                value: 0.14, // Simulated progress
                                strokeWidth: 6,
                                backgroundColor: Colors.white54,
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              ),
                            ),
                            Column(
                              children: [
                                Text("START IN",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                                Text("5",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32,
                                        fontWeight: FontWeight.w900)),
                              ],
                            ),
                          ],
                        ),

                        // Right Play Icon
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: IconButton(
                            icon: Icon(Icons.play_arrow,
                                color: Colors.white, size: 32),
                            onPressed: () {}, // Play/Next action
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),

                    // Progress Count Below Timer
                    Text(
                      "1/6",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
