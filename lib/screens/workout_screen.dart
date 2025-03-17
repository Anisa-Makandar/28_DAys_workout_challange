// import 'package:flutter/material.dart';

// class WorkoutScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> workoutDays = [
//     {"day": "Day 1", "time": "Today, 03:00pm", "status": "Completed"},
//     {"day": "Day 2", "time": "Today, 03:00pm", "status": "Start"},
//     {"day": "Day 3", "time": "Today, 03:00pm", "status": "Locked"},
//     {"day": "Day 4", "time": "Today, 03:00pm", "status": "Break Day"},
//     {"day": "Day 5", "time": "Today, 03:00pm", "status": "Locked"},
//     {"day": "Day 6", "time": "Today, 03:00pm", "status": "Locked"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(160),
//         child: _buildAppBar(),
//       ),
//       body: ListView.builder(
//         padding: EdgeInsets.all(16),
//         itemCount: workoutDays.length,
//         itemBuilder: (context, index) {
//           return _buildWorkoutCard(workoutDays[index]);
//         },
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
//           SizedBox(
//             height: 12,
//           ),
//           Row(
//             children: [
//               Icon(Icons.arrow_back, color: Colors.white, size: 28),
//               Spacer(),
//               Icon(Icons.help_outline, color: Colors.white, size: 28),
//             ],
//           ),
//           // SizedBox(height: 10),
//           Row(
//             children: [
//               CircleAvatar(
//                 radius: 25,
//                 backgroundImage: AssetImage("assets/images/profile.jpg"),
//               ),
//               SizedBox(width: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Six Pack Workout\nBeginner",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold)),
//                   Row(
//                     children: List.generate(5, (index) {
//                       return Icon(Icons.star, color: Colors.yellow, size: 16);
//                     }),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 80),
//                 child:
//                     Text("01/28 Days", style: TextStyle(color: Colors.white)),
//               ),
//               Text("0% Completed", style: TextStyle(color: Colors.white)),
//             ],
//           ),
//           // SizedBox(height: 5),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Progress Text
//               Text(
//                 "Progress",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold),
//               ),

//               SizedBox(width: 10), // Space between text and progress bar

//               // Progress Bar
//               Expanded(
//                 child: LinearProgressIndicator(
//                   value: 0.0, // Change this dynamically based on progress
//                   backgroundColor: Colors.white,
//                   minHeight: 4, // Adjust height of progress bar
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ✅ Workout Day Card
//   Widget _buildWorkoutCard(Map<String, dynamic> data) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 10),
//       padding: EdgeInsets.all(16),
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
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               CircleAvatar(
//                 radius: 22, // Increased radius for better spacing
//                 backgroundColor: Colors.blue[100],
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.fitness_center,
//                             color: Colors.black, size: 18),
//                         SizedBox(height: 2), // Space between icon and text
//                         Center(
//                           child: Text(
//                             "5 Excercses", // Shortened text to fit inside the circle
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 5,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(width: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     data["day"],
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   Text(data["time"], style: TextStyle(color: Colors.grey)),
//                 ],
//               ),
//             ],
//           ),
//           _buildStatusButton(data["status"]),
//         ],
//       ),
//     );
//   }

//   // ✅ Status Button (Completed, Start, Locked, Break)
//   Widget _buildStatusButton(String status) {
//     if (status == "Completed") {
//       return Container(
//         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//         width: 110,
//         decoration: BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.circular(22),
//         ),
//         child: Center(
//             child: Text("COMPLETED", style: TextStyle(color: Colors.white))),
//       );
//     } else if (status == "Start") {
//       return Container(
//         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//         width: 110,
//         decoration: BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.circular(22),
//         ),
//         child:
//             Center(child: Text("START", style: TextStyle(color: Colors.white))),
//       );
//     } else if (status == "Break Day") {
//       return Padding(
//         padding: const EdgeInsets.only(right: 40.0),
//         child: Icon(Icons.free_breakfast, color: Colors.grey),
//       );
//     } else {
//       return Padding(
//         padding: const EdgeInsets.only(right: 40.0),
//         child: Icon(Icons.lock, color: Colors.grey),
//       );
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:health_gym_project_altamash/screens/guide_screen.dart';

class WorkoutScreen extends StatelessWidget {
  final List<Map<String, dynamic>> workoutDays = [
    {"day": "Day 1", "time": "Today, 03:00pm", "status": "Completed"},
    {"day": "Day 2", "time": "Today, 03:00pm", "status": "Start"},
    {"day": "Day 3", "time": "Today, 03:00pm", "status": "Locked"},
    {"day": "Day 4", "time": "Today, 03:00pm", "status": "Break Day"},
    {"day": "Day 5", "time": "Today, 03:00pm", "status": "Locked"},
    {"day": "Day 6", "time": "Today, 03:00pm", "status": "Locked"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160),
        child: _buildAppBar(),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: workoutDays.length,
        itemBuilder: (context, index) {
          return _buildWorkoutCard(context, workoutDays[index]);
        },
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
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.arrow_back, color: Colors.white, size: 28),
              Spacer(),
              Icon(Icons.help_outline, color: Colors.white, size: 28),
            ],
          ),
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
                  Text("Six Pack Workout\nBeginner",
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Progress",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Expanded(
                child: LinearProgressIndicator(
                  value: 0.0,
                  backgroundColor: Colors.white,
                  minHeight: 4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ✅ Workout Day Card
  Widget _buildWorkoutCard(BuildContext context, Map<String, dynamic> data) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(16),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.blue[100],
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.fitness_center,
                            color: Colors.black, size: 18),
                        SizedBox(height: 2),
                        Center(
                          child: Text(
                            "5 Exercises",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 6,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data["day"],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(data["time"], style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          _buildStatusButton(context, data["status"]),
        ],
      ),
    );
  }

  // ✅ Status Button (Completed, Start, Locked, Break)
  Widget _buildStatusButton(BuildContext context, String status) {
    if (status == "Completed") {
      return GestureDetector(
        onTap: () {
          // Navigate to WorkoutScreen when Completed is clicked
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WorkoutGuideScreen()),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          width: 110,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Center(
              child: Text("COMPLETED", style: TextStyle(color: Colors.white))),
        ),
      );
    } else if (status == "Start") {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        width: 110,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(22),
        ),
        child:
            Center(child: Text("START", style: TextStyle(color: Colors.white))),
      );
    } else if (status == "Break Day") {
      return Padding(
        padding: const EdgeInsets.only(right: 40.0),
        child: Icon(Icons.free_breakfast, color: Colors.grey),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(right: 40.0),
        child: Icon(Icons.lock, color: Colors.grey),
      );
    }
  }
}
