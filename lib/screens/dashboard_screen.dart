// import 'package:flutter/material.dart';

// class DashboardScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> workoutData = [
//     {
//       "title": "28 DAYS\nBEGINNER SIX PACK WORKOUT - NO EQUIPMENT NEEDED!",
//       // "subtitle": "BEGINNER SIX PACK WORKOUT - NO EQUIPMENT NEEDED!",
//       "buttonText": "START",
//       "image": "assets/images/firstcart_img1.png",
//       "gradient": LinearGradient(
//         colors: [Color(0xFFE4EEE9), Color(0xFF93A5CE)],
//         begin: Alignment.topLeft,
//         end: Alignment.topRight,
//       ),
//     },
//     {
//       "title": "EXPERTS\nDIET PLAN",
//       "buttonText": "GET PLAN",
//       "image":
//           "assets/images/Leonardo_Kino_XL_create_handsome_fitness_man_full_image_3.png",
//       "gradient": LinearGradient(
//         colors: [Color(0xFF197225), Color(0xFF1FA323)],
//         begin: Alignment.topLeft,
//         end: Alignment.topRight,
//       ),
//     },
//     {
//       "title": "BUILD YOUR PERFECT WORKOUT PLAN!",
//       "buttonText": "CREATE PLAN",
//       "image": "assets/images/thirdcart_img3.png",
//       "gradient": LinearGradient(
//         colors: [Color(0xFFDB6885), Color(0xFF972239)],
//         begin: Alignment.topLeft,
//         end: Alignment.topRight,
//       ),
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(65), // AppBar height
//         child: Container(
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//             colors: [
//               Color(0xff55a2fa),
//               Color(0xff2c67f2),
//             ],
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//             stops: [0.15, 1.0],
//           )),
//           child: AppBar(
//             backgroundColor: Colors.transparent, // Makes the gradient visible
//             elevation: 0, // Removes shadow
//             leading: Padding(
//               padding: const EdgeInsets.only(left: 4.0, bottom: 4),
//               child: Row(
//                 children: [
//                   Stack(
//                     children: [
//                       Container(
//                         width: 72,
//                         height: 72,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(width: 1, color: Colors.white),
//                         ),
//                         child: CircleAvatar(
//                           radius: 40,
//                           backgroundImage:
//                               AssetImage("assets/images/fullbody2.jpeg"),
//                           backgroundColor: Colors.transparent,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 4),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Welcome Back...!",
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         "Ready for today's workout",
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             actions: [
//               IconButton(
//                 icon: Icon(Icons.menu, color: Colors.white),
//                 onPressed: () {
//                   // Handle menu action
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Heading Text
//           Padding(
//             padding: EdgeInsets.only(left: 16, right: 16, top: 16),
//             child: Text(
//               "Six Pack in 28 Days",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),

//           // Workout List
//           Expanded(
//             child: ListView.builder(
//               itemCount: workoutData.length,
//               itemBuilder: (context, index) {
//                 return workoutCard(
//                   workoutData[index]["title"],
//                   // workoutData[index]["subtitle"],
//                   workoutData[index]["buttonText"],
//                   workoutData[index]["image"],
//                   workoutData[index]["gradient"],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget workoutCard(String title, String buttonText, String imagePath,
//       LinearGradient gradient) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       decoration: BoxDecoration(
//         gradient: gradient,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         children: [
//           // Image (50% width)
//           Expanded(
//             child: ClipRRect(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(16),
//                 bottomLeft: Radius.circular(16),
//               ),
//               child: Image.asset(
//                 imagePath,
//                 height: 150,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           // Text & Button Section (50% width)
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   SizedBox(
//                     height: 40,
//                     width: double.infinity, // Makes button full width
//                     child: InkWell(
//                       onTap: () {},
//                       borderRadius: BorderRadius.circular(22),
//                       child: Container(
//                         padding: EdgeInsets.symmetric(vertical: 8),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(22),
//                           gradient: LinearGradient(
//                             colors: [Color(0xFF55A2FA), Color(0xFF2C67F2)],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                         ),
//                         alignment: Alignment.center,
//                         child: Text(
//                           buttonText,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';
import 'package:health_gym_project_altamash/HistroyBloc/history_bloc.dart';
import 'package:health_gym_project_altamash/HistroyBloc/history_event.dart';
import 'package:health_gym_project_altamash/favourites_bloc/favourites_bloc.dart';
import 'package:health_gym_project_altamash/favourites_bloc/favourites_event.dart';
import 'package:health_gym_project_altamash/screens/UTILS/appcolors.dart';
import 'package:health_gym_project_altamash/screens/UTILS/textdecoration.dart';
import 'package:health_gym_project_altamash/screens/create_plan_screen1.dart';
import 'package:health_gym_project_altamash/screens/history_screen.dart';
import 'package:health_gym_project_altamash/screens/menu_bar_screen.dart';
import 'package:health_gym_project_altamash/screens/notification_screen.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  double _currentVolume = 0.5;
  int _currentIndex = 0;
  var daysFull;
  var daysUpper;
  var daysLower;
  var userName = "";
  double exerciseDuration = 30;
  double restDuration = 5;
  double guideDuration = 8;
  String uid = "";
  bool isActiveTab = false;
  int selectedidx = 0;
  late TabController _tabController;
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    super.initState();
    getUid();
    _getCurrentVolume();
    final namebox = Hive.box('days');

    // Debugging Hive box
    print("All keys: ${namebox.keys}");
    print("All values: ${namebox.values}");

    var dayFullBody = namebox.get("Full Body");
    var daysUpperBody = namebox.get("Upper Body");
    var daysLowerBody = namebox.get("Lower Body");
    print("Retrieved day: $dayFullBody");
    print("Retrieved day: $daysUpperBody");
    print("Retrieved day: $daysLowerBody");

    setState(() {
      daysFull = dayFullBody ?? 0;
      daysUpper = daysUpperBody ?? 0;
      daysLower = daysLowerBody ?? 0;
    });
  }

  final guidebox = Hive.openBox("guideduration");
  final restbox = Hive.openBox("restduration");
  final exercise = Hive.openBox("exerciseduration");
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> getUid() async {
    var prefs = await SharedPreferences.getInstance();
    uid = prefs.getString("uid") ?? "";
    print(" uid : ${uid}");

    setState(() {});
  }

  void resetDaysAndDurations() async {
    var namebox = await Hive.openBox("namebox");
    var guidebox = await Hive.openBox("guideduration");
    var restbox = await Hive.openBox("restduration");
    var exercise = await Hive.openBox("exerciseduration");

    // Set all days to 0
    await namebox.put("Full Body", 0);
    await namebox.put("Upper Body", 0);
    await namebox.put("Lower Body", 0);

    // Retrieve the updated values
    var dayFullBody = namebox.get("Full Body");
    var daysUpperBody = namebox.get("Upper Body");
    var daysLowerBody = namebox.get("Lower Body");

    print("Updated day: $dayFullBody");
    print("Updated day: $daysUpperBody");
    print("Updated day: $daysLowerBody");

    setState(() {
      daysFull = dayFullBody ?? 0;
      daysUpper = daysUpperBody ?? 0;
      daysLower = daysLowerBody ?? 0;
    });

    // Set all durations to 0
    await guidebox.put("guideduration", 0);
    await restbox.put("restduration", 0);
    await exercise.put("exerciseduration", 0);

    print("Guide duration reset to 0");
    print("Rest duration reset to 0");
    print("Exercise duration reset to 0");
  }

  void RestartWorkout(BuildContext context) {
    context.read<FavouritesBloc>().add(DeletAllFavouritesEvent());
    context.read<HistoryBloc>().add(AllHistoryDeleteEvent());
  }

  Future<void> _getCurrentVolume() async {
    try {
      double? volume = await FlutterVolumeController.getVolume();
      if (mounted) {
        setState(() {
          _currentVolume = volume ?? 0.5; // Set to default if null
        });
      }
    } catch (e) {
      print("Error getting volume: $e");
    }
  }

  void _setVolume(double volume) {
    print("Setting volume: $volume");
    setState(() {
      _currentVolume = volume; // Update slider immediately
    });
    FlutterVolumeController.setVolume(
        volume); // Update system volume asynchronously
  }

  Future<void> _showVolumeDialog() async {
    await _getCurrentVolume(); // Fetch the current volume before showing the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Volume Setting",
            style: DrawerTextStyle(),
            textAlign: TextAlign.center,
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min, // Compact dialog
                children: [
                  Text("Current Volume: ${(_currentVolume * 100).toInt()}%",
                      style: DrawerTextStyle()),
                  Slider(
                    activeColor: AppColors.secondaryolor,
                    value: _currentVolume,
                    min: 0.0,
                    max: 1.0,
                    divisions: 10, // Optional: For finer control
                    label: "${(_currentVolume * 100).toInt()}%",
                    onChanged: (double newValue) {
                      print("Slider moved to: $newValue");
                      setState(() {
                        _currentVolume = newValue; // Update local dialog state
                      });
                      _setVolume(newValue); // Update system volume
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          /* boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0, // Elevation effect
                                    offset: Offset(0, 3),

                                  ),
                                ],*/
                          borderRadius: BorderRadius.circular(7),
                          color: AppColors.secondaryolor),
                      width: 70,
                      height: 30,
                      child: Text(
                        "Finished",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          actions: [],
        );
      },
    );
  }

  void showRestartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(
            "Restart Workout",
            style: DrawerTextStyle(),
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: 200,
            child: Column(
              children: [
                Text(
                    "Are you sure you want to restart your workout? This will delete all favorites and workout history.",
                    style: DrawerTextStyle()),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            /* boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2.0, // Elevation effect
                                      offset: Offset(0, 3),

                                    ),
                                  ],*/
                            borderRadius: BorderRadius.circular(7),
                            color: AppColors.secondaryolor),
                        width: 70,
                        height: 30,
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        RestartWorkout(
                            context); // Call function to reset workout
                        resetDaysAndDurations(); // Reset durations after workout restart
                        Navigator.pop(dialogContext); // Close the dialog
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            /*   boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2.0, // Elevation effect
                                offset: Offset(0, 3),

                              ),
                            ],*/
                            borderRadius: BorderRadius.circular(7),
                            color: AppColors.secondaryolor),
                        width: 70,
                        height: 30,
                        child: Text(
                          "Restart",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          /*    actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext); // ❌ No reset on cancel
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                RestartWorkout(context); // Call function to reset workout
                resetDaysAndDurations(); // Reset durations after workout restart
                Navigator.pop(dialogContext); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],*/
        );
      },
    );
  }

  void TimerDialogue({required double width}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.white.withOpacity(0.4),
            child: AlertDialog(
              elevation: 11,
              shadowColor: Colors.black,
              title: Column(
                children: [
                  Icon(
                    Icons.watch_later_rounded,
                    color: AppColors.secondaryolor,
                    size: 29,
                  ),
                  Text(
                    "Time managment",
                    style: DrawerTextStyle(),
                  ),
                ],
              ),
              content: Container(
                //color: Colors.blue,
                width: width * 0.8,
                child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min, // Compact dialog
                      children: [
                        Text("Exercise Duration",
                            textAlign: TextAlign.start,
                            style: DrawerTextStyle()),
                        Column(
                          children: [
                            Text("${exerciseDuration.toInt()} seconds",
                                textAlign: TextAlign.center,
                                style: DrawerTextStyle()),
                            Slider(
                              activeColor: AppColors.secondaryolor,
                              value: exerciseDuration,
                              min: 5.0, // Keep the min value as-is
                              max: 100.0, // Max value as-is
                              divisions: (100 -
                                  5), // Ensure each division corresponds to 1 unit
                              label: "${exerciseDuration.toInt()}",
                              onChanged: (double newValue) {
                                setState(() {
                                  exerciseDuration = newValue;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text("Rest Duration",
                            textAlign: TextAlign.start,
                            style: DrawerTextStyle()),
                        Column(
                          children: [
                            Text("${restDuration.toInt()} seconds",
                                textAlign: TextAlign.center,
                                style: DrawerTextStyle()),
                            Slider(
                              activeColor: AppColors.secondaryolor,
                              value: restDuration,
                              min: 5.0, // Keep the min value as-is
                              max: 100.0, // Max value as-is
                              divisions: (100 -
                                  5), // Ensure each division corresponds to 1 unit
                              label: "${restDuration.toInt()}",
                              onChanged: (double newValue) {
                                setState(() {
                                  restDuration = newValue;
                                });
                              },
                            ),
                          ],
                        ),
                        Text("Guide Duration",
                            textAlign: TextAlign.start,
                            style: DrawerTextStyle()),
                        Column(
                          children: [
                            Text("${guideDuration.toInt()} seconds",
                                textAlign: TextAlign.center,
                                style: DrawerTextStyle()),
                            Slider(
                              activeColor: AppColors.secondaryolor,
                              value: guideDuration,
                              min: 8.0, // Keep the min value as-is
                              max: 100.0, // Max value as-is
                              divisions: (100 -
                                  8), // Ensure each division corresponds to 1 unit
                              label: "${guideDuration.toInt()}",
                              onChanged: (double newValue) {
                                setState(() {
                                  guideDuration = newValue;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    /* boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0, // Elevation effect
                                    offset: Offset(0, 3),

                                  ),
                                ],*/
                                    borderRadius: BorderRadius.circular(7),
                                    color: AppColors.secondaryolor),
                                width: 70,
                                height: 30,
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                final guidebox = Hive.box("guideduration");
                                final restbox = Hive.box("restduration");
                                final exercise = Hive.box("exerciseduration");

                                guidebox.put("guidetime", guideDuration);
                                restbox.put("resttime", restDuration);
                                exercise.put("exercisetime", exerciseDuration);

                                //guidebox.put("",);
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2.0, // Elevation effect
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(7),
                                    color: AppColors.secondaryolor),
                                width: 70,
                                height: 30,
                                child: Text(
                                  "Set",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        });
  }

  bool isProfilePicSelected = false;
  static File? imgfile;
  XFile? imgPicked;
  bool isCamera = false;

  final List<Map<String, dynamic>> workoutData = [
    {
      "title": "28 DAYS\nBEGINNER SIX PACK WORKOUT - NO EQUIPMENT NEEDED!",
      "buttonText": "START",
      "image": "assets/images/firstcart_img1.png",
      "gradient": LinearGradient(
        colors: [Color(0xFFE4EEE9), Color(0xFF93A5CE)],
        begin: Alignment.topLeft,
        end: Alignment.topRight,
      ),
    },
    {
      "title": "EXPERTS\nDIET PLAN",
      "buttonText": "GET PLAN",
      "image":
          "assets/images/Leonardo_Kino_XL_create_handsome_fitness_man_full_image_3.png",
      "gradient": LinearGradient(
        colors: [Color(0xFF197225), Color(0xFF1FA323)],
        begin: Alignment.topLeft,
        end: Alignment.topRight,
      ),
    },
    {
      "title": "BUILD YOUR PERFECT WORKOUT PLAN!",
      "buttonText": "CREATE PLAN",
      "image": "assets/images/thirdcart_img3.png",
      "gradient": LinearGradient(
        colors: [Color(0xFFDB6885), Color(0xFF972239)],
        begin: Alignment.topLeft,
        end: Alignment.topRight,
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xff55a2fa),
              Color(0xff2c67f2),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.15, 1.0],
          )),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 4.0, bottom: 4),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.white),
                        ),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage("assets/images/fullbody2.jpeg"),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome Back...!",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Ready for today's workout",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomDrawer()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom TabBar Section
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xFF2C67F2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    color: Color(0xFF2C67F2),
                    width: 4.5,
                  )),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                ),
                labelColor: Color(0xFF2C67F2),
                unselectedLabelColor: Colors.white,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
                tabs: [
                  Tab(text: "Beginner"),
                  Tab(text: "Intermediate"),
                  Tab(text: "Advanced"),
                ],
              ),
            ),
          ),

          // First Workout Card with Unique Border Radius
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: topWorkoutCard(
              workoutData[0]["title"],
              workoutData[0]["buttonText"],
              workoutData[0]["image"],
              workoutData[0]["gradient"],
            ),
          ),

          // Remaining Workout Cards (Inside ListView)
          Expanded(
            child: ListView.builder(
              itemCount: workoutData.length - 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: defaultWorkoutCard(
                    workoutData[index + 1]["title"],
                    workoutData[index + 1]["buttonText"],
                    workoutData[index + 1]["image"],
                    workoutData[index + 1]["gradient"],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Top Workout Card with Different Border Radius
  Widget topWorkoutCard(String title, String buttonText, String imagePath,
      LinearGradient gradient) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: workoutCardContent(title, buttonText, imagePath),
    );
  }

  /// Default Workout Card for Remaining Cards
  Widget defaultWorkoutCard(String title, String buttonText, String imagePath,
      LinearGradient gradient) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16), // Normal rounded corners
      ),
      child: workoutCardContent(title, buttonText, imagePath),
    );
  }

  /// Shared Workout Card Content

  Widget workoutCardContent(String title, String buttonText, String imagePath) {
    return Row(
      children: [
        // Image
        Expanded(
          child: ClipRRect(
            child: Image.asset(
              imagePath,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Text & Button
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  width: double.infinity, // Makes button full width
                  child: InkWell(
                    onTap: () {
                      // Condition to check button text
                      if (buttonText.toUpperCase() == "CREATE PLAN") {
                        Navigator.push(
                          context,
                          // MaterialPageRoute(
                          //     builder: (context) => CreatePlanScreenFirst()),
                          MaterialPageRoute(
                              builder: (context) => ActivityHistoryPage()),
                        );
                      } else {
                        print("Button Clicked: $buttonText");
                        // Add other functionality here if needed
                      }
                    },
                    borderRadius: BorderRadius.circular(22),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        gradient: LinearGradient(
                          colors: [Color(0xFF55A2FA), Color(0xFF2C67F2)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
