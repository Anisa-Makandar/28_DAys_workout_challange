import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_gym_project_altamash/screens/dashboard_screen.dart';
import 'package:health_gym_project_altamash/screens/signin_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import '../foreget_password.dart';

class AbsLoginPage extends StatefulWidget {
  const AbsLoginPage({super.key});

  @override
  State<AbsLoginPage> createState() => _AbsLoginPageState();
}

class _AbsLoginPageState extends State<AbsLoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pswrdContoller = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  //final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> loginWithGoogle() async {
    try {
      final User? user = auth.currentUser;

      if (user != null) {
        // User is logged in
        print('User logged in: ${user.displayName}');
        var prefs = await SharedPreferences.getInstance();
        prefs.setBool("isLoggedIn", true)!;
        print('Email: ${user.email}');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => DashboardScreen()));
      } else {
        print('No user logged in.');
      }
    } catch (e) {
      print('Error during Google Login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return WillPopScope(
      onWillPop: () async {
        // Reset orientation to allow both landscape and portrait when leaving
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Hi,Welcome Back!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Color(0xff1e1e1e)),
                      ),
                      Text(
                        "Log in to explore continue!",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff4a4545),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.waving_hand_rounded,
                    color: CupertinoColors.systemYellow,
                    size: 25,
                  )
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage("assets/images/Ellipse 1-shadow (1).png"),
                      fit: BoxFit.contain),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Text(
                        "Email",
                        style:
                            TextStyle(color: Color(0xff1e1e1e), fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff2c67f2)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        prefixIcon: Icon(
                          Icons.forward_to_inbox,
                          color: Color(0xff2c67f2),
                          size: 27,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff2c67f2)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Color(0xff2c67f2),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        hintStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          color: Color(0xffC8C8C8),
                        ),
                        hintText: "Ex:abc@example.com",
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Text(
                        "Your Password",
                        style:
                            TextStyle(color: Color(0xff1e1e1e), fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    TextField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      textAlign: TextAlign.justify,
                      controller: pswrdContoller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_open,
                          color: Color(0xff2c67f2),
                          size: 27,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff2c67f2)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xff2c67f2)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Color(0xff2c67f2),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        hintStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          letterSpacing: 3,
                          color: Color(0xffC8C8C8),
                        ),
                        hintText: "******",
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: AbsSignInPage()),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Color(0xff2c67f2),
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xff2c67f2)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () async {
                        FirebaseAuth mauth = FirebaseAuth.instance;
                        try {
                          var cred = await mauth.signInWithEmailAndPassword(
                              email: emailController.text,
                              password: pswrdContoller.text);
                          if (cred != null) {
                            print("uid is ${cred.user!.uid}");

                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString("uid", cred.user!.uid);

                            prefs.setBool('isLoggedIn', true);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DashboardScreen()));
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("error :${e.toString()}")));
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: width,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.07),
                            color: Color(0xffAF001A),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff55a2fa),
                                Color(0xff2c67f2),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [0.15, 1.0],
                            )),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Divider(
                            height: 7,
                            endIndent: 30,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "or",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Expanded(
                          child: Divider(
                            height: 7,
                            indent: 30,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Login up with",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xff1e1e1e)),
                          textAlign: TextAlign.center,
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            loginWithGoogle();
                          },
                          child: Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(width: 2, color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 30,
                                  child: Image.asset(
                                    "assets/images/google.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  "Google",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff1e1e1e),
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 2, color: Colors.grey)),
                          width: 150,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  height: 30,
                                  child: Image.asset(
                                    "assets/images/facebook.png",
                                    fit: BoxFit.contain,
                                  )),
                              Text(
                                "Facebook",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff1e1e1e),
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: AbsSignInPage()));
                        },
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "Don't have an Account?  ",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff1e1e1e),
                                  fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: "Register",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff2c67f2),
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xff2c67f2)))
                        ])),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
