import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_gym_project_altamash/screens/UTILS/appcolors.dart';
import 'package:health_gym_project_altamash/screens/achivement_screen.dart';
import 'package:health_gym_project_altamash/screens/dashboard_screen.dart';
import 'package:health_gym_project_altamash/screens/fev_screen.dart';
import 'package:health_gym_project_altamash/screens/guide_screen.dart';
import 'package:health_gym_project_altamash/screens/profile_screen.dart';
import 'package:health_gym_project_altamash/screens/workout_screen.dart';
import 'package:health_gym_project_altamash/screens/workoutplan_screen.dart';

class Dashboardpage extends StatefulWidget {
  const Dashboardpage({super.key});

  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage> {
  int _currentIndex = 0;

  List pages = [
    DashboardScreen(),
    FevScreen(),
    // AchievementScreen(),
    WorkoutScreen(),
    // CaloriesWorkoutScreen(),
    ProfileScreen(),
  ];
  int currindx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currindx],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF2C67F2),
        selectedItemColor: const Color(0xFF2C67F2),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 1,

        //Color(0xfff6f6f6),
        currentIndex: currindx,
        onTap: (index) {
          setState(() {
            currindx = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.home, 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.favorite, 1),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.fitness_center, 2),
            label: 'Workout',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.person, 3),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    bool isSelected = currindx == index;
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isSelected)
          Container(
            //margin: EdgeInsets.only(bottom: 20),
            width: 40,
            height: 30,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.5),
                    const Color(0xFF268BFF).withOpacity(0.4)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.6, 1.0]),
              //color: Colors.white.withOpacity(0.2), // Background effect
              //shape: BoxShape.circle, // Rounded circle for the selected item
            ),
          ),
        Icon(icon, size: 25, color: isSelected ? Colors.white : Colors.white70),
      ],
    );
  }
}
