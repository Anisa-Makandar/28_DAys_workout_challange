// import 'package:flutter/material.dart';

// class WorkoutScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> workouts = List.generate(
//       5,
//       (index) => {
//             "title": "High Plank",
//             "time": "00:30 Sec",
//             "calories": "18 Kcal",
//             "image":
//                 "assets/images/plank.png", // Replace with your actual image path
//           });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(180),
//         child: _buildAppBar(),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               itemCount: workouts.length,
//               itemBuilder: (context, index) {
//                 return _buildWorkoutCard(workouts[index]);
//               },
//             ),
//           ),
//           _buildStartButton(),
//         ],
//       ),
//     );
//   }

//   // ✅ Gradient AppBar
//   Widget _buildAppBar() {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xff55a2fa), Color(0xff2c67f2)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(20),
//           bottomRight: Radius.circular(20),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(Icons.arrow_back, color: Colors.white, size: 28),
//               Spacer(),
//               Icon(Icons.help_outline, color: Colors.white, size: 28),
//             ],
//           ),
//           SizedBox(height: 10),

//           // Profile and Title
//           Row(
//             children: [
//               CircleAvatar(
//                 radius: 30,
//                 backgroundImage: AssetImage(
//                     "assets/images/profile.jpg"), // Replace with actual image
//               ),
//               SizedBox(width: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Six Pack Workout\nPlan - Beginner",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold)),
//                   Row(
//                     children: List.generate(
//                         5,
//                         (index) =>
//                             Icon(Icons.star, color: Colors.yellow, size: 16)),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(height: 10),

//           // Progress Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Progress", style: TextStyle(color: Colors.white)),
//               Text("01/28 Days", style: TextStyle(color: Colors.white)),
//               Text("0% Completed", style: TextStyle(color: Colors.white)),
//             ],
//           ),
//           SizedBox(height: 5),

//           // Progress Bar
//           LinearProgressIndicator(
//             value: 0.0,
//             backgroundColor: Colors.white.withOpacity(0.5),
//             minHeight: 5,
//           ),
//         ],
//       ),
//     );
//   }

//   // ✅ Workout Card
//   Widget _buildWorkoutCard(Map<String, dynamic> data) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 10),
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 5,
//             spreadRadius: 1,
//           )
//         ],
//       ),
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Image.asset(
//               data["image"],
//               height: 50,
//               width: 50,
//               fit: BoxFit.cover,
//             ),
//           ),
//           SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   data["title"],
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Icon(Icons.timer, color: Colors.blue, size: 16),
//                     SizedBox(width: 4),
//                     Text(data["time"], style: TextStyle(color: Colors.grey)),
//                     SizedBox(width: 12),
//                     Icon(Icons.local_fire_department,
//                         color: Colors.blue, size: 16),
//                     SizedBox(width: 4),
//                     Text(data["calories"],
//                         style: TextStyle(color: Colors.grey)),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ✅ Start Button
//   Widget _buildStartButton() {
//     return Padding(
//       padding: EdgeInsets.all(16),
//       child: SizedBox(
//         width: double.infinity,
//         height: 50,
//         child: ElevatedButton(
//           onPressed: () {},
//           style: ElevatedButton.styleFrom(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30),
//             ),
//             backgroundColor: Color(0xff2C67F2),
//           ),
//           child: Text(
//             "START",
//             style: TextStyle(
//                 color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CaloriesWorkoutScreen extends StatelessWidget {
  final List<Map<String, dynamic>> workouts = List.generate(
      5,
      (index) => {
            "title": "High Plank",
            "time": "00:30 Sec",
            "calories": "18 Kcal",
            "image":
                "assets/images/male 1.png", // Replace with actual image path
          });

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
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: workouts.length,
              itemBuilder: (context, index) {
                return _buildWorkoutCard(workouts[index]);
              },
            ),
          ),
          _buildStartButton(),
        ],
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
              Spacer(),
              Icon(Icons.help_outline, color: Colors.white, size: 28),
            ],
          ),
          // SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/images/profile.jpg"),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Six Pack Workout\nPlan-Beginner",
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

              // Progress Bar
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

  // ✅ Workout Card
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
            blurRadius: 5,
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        children: [
          // Image inside a Container with custom size
          Card(
            child: Container(
              height: 60, // Adjust height as needed
              width: 60, // Adjust width as needed
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 1,
                  )
                ],
                image: DecorationImage(
                  image: AssetImage(data["image"]), // Load image dynamically
                  fit: BoxFit.cover, // Ensure image covers the container
                ),
              ),
            ),
          ),
          SizedBox(width: 12),

          // Workout Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["title"],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.timer, color: Colors.blue, size: 16),
                      SizedBox(width: 4),
                      Text(data["time"], style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 12),
                      Icon(Icons.local_fire_department,
                          color: Colors.blue, size: 16),
                      SizedBox(width: 4),
                      Text(data["calories"],
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Start Button
  Widget _buildStartButton() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: SizedBox(
        width: 150,
        height: 40,
        child: InkWell(
          onTap: () {
            // Handle button tap
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
              "START",
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
}
