import 'package:flutter/material.dart';

class CreatePlanScreenSecond extends StatefulWidget {
  @override
  State<CreatePlanScreenSecond> createState() => _CreatePlanScreenSecondState();
}

class _CreatePlanScreenSecondState extends State<CreatePlanScreenSecond> {
  final List<Map<String, dynamic>> favoriteWorkouts = List.generate(
    5,
    (index) => {
      "title": "High Plank",
      "icon": Icons.favorite,
      "image": "assets/images/male 1.png",
    },
  );

  Set<int> selectedWorkouts = {}; // Track selected workouts

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
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: favoriteWorkouts.length,
              itemBuilder: (context, index) {
                return _buildWorkoutCard(favoriteWorkouts[index], index);
              },
            ),
          ),
          // Centered "CREATE" Button
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: _buildCreateButton(),
          ),
        ],
      ),
    );
  }

  // ✅ Workout Card with ADD/REMOVE Button
  Widget _buildWorkoutCard(Map<String, dynamic> data, int index) {
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
          // Workout Image Card
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

          // Workout Title & ADD/REMOVE Button
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
                _buildToggleButton(index),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ✅ ADD/REMOVE Button
  Widget _buildToggleButton(int index) {
    bool isAdded = selectedWorkouts.contains(index);

    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: SizedBox(
        width: 100,
        height: 40,
        child: InkWell(
          onTap: () {
            setState(() {
              if (isAdded) {
                selectedWorkouts.remove(index);
              } else {
                selectedWorkouts.add(index);
              }
            });
          },
          borderRadius: BorderRadius.circular(30),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: isAdded
                    ? [Colors.redAccent, Colors.red] // REMOVE Button
                    : [Color(0xff55a2fa), Color(0xff2c67f2)], // ADD Button
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Text(
              isAdded ? "REMOVE" : "ADD",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ✅ Centered "CREATE" Button (Opens Popup)
  Widget _buildCreateButton() {
    return SizedBox(
      width: 200,
      height: 50,
      child: InkWell(
        onTap: () {
          _showCreatePlanPopup();
        },
        borderRadius: BorderRadius.circular(30),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: [Color(0xff55a2fa), Color(0xff2c67f2)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Text(
            "CREATE",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // ✅ Popup Dialog for "Name Your Plan"
  void _showCreatePlanPopup() {
    TextEditingController planNameController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false, // Prevents dismissing when tapping outside
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: EdgeInsets.zero,
          content: Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Close Button (Top Right)
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close, color: Colors.blue),
                  ),
                ),

                // Title: "Name Your Plan"
                Text(
                  "Name Your Plan",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 20),

                // TextField for entering plan name
                TextField(
                  controller: planNameController,
                  decoration: InputDecoration(
                    hintText: "Enter plan name...",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  ),
                ),

                SizedBox(height: 20),

                // "Next" Button
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context); // Close popup
                      print("Plan Name: ${planNameController.text}");
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff55a2fa),
                            Color(0xff2c67f2),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

// ✅ Start Button
  Widget _buildStartButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        width: 150,
        height: 40,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreatePlanScreenSecond()),
            );
          },
          borderRadius: BorderRadius.circular(30), // Match rounded corners
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: [
                  Color(0xff55a2fa),
                  Color(0xff2c67f2),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Text(
              "CREATE",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  // ✅ Gradient AppBar
  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
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
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Icon(Icons.arrow_back, color: Colors.white, size: 28),
            ],
          ),
          // SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/profile.jpg"),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("My Workout Plan",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(Icons.star, color: Colors.yellow, size: 16);
                    }),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 80),
                child:
                    Text("01/28 Days", style: TextStyle(color: Colors.white)),
              ),
              Text("0% Completed", style: TextStyle(color: Colors.white)),
            ],
          ),
          // SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Progress Text
              Text(
                "Progress",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),

              SizedBox(width: 10), // Space between text and progress bar

              Expanded(
                child: LinearProgressIndicator(
                  value: 0.0, // Change this dynamically based on progress
                  backgroundColor: Colors.white,
                  minHeight: 4, // Adjust height of progress bar
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
