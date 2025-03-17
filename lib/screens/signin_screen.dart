import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health_gym_project_altamash/screens/gender_screen.dart';
import 'package:health_gym_project_altamash/screens/login_screen.dart';

import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AbsSignInPage extends StatefulWidget {
  const AbsSignInPage({super.key});

  @override
  State<AbsSignInPage> createState() => _AbsSignInPageState();
}

class _AbsSignInPageState extends State<AbsSignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController pswrdcontoller = TextEditingController();
  TextEditingController repswrdcontroller = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    Future<void> signUpWithGoogle(BuildContext context) async {
      try {
        // Google Sign-In Process
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        if (googleUser == null) {
          print('Google Sign-In cancelled.');
          return;
        }

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Firebase Authentication
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        final User? user = userCredential.user;

        if (user == null) {
          print('Error: User is null after signing in with Google.');
          return;
        }

        // Save UID in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("uid", user.uid);
        prefs.setBool("isLoggedIn", true)!;
        // Check if user exists in Firestore
        final DocumentSnapshot userDoc =
            await firestore.collection('users').doc(user.uid).get();

        if (!userDoc.exists) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("uid", user.uid);
          prefs.setBool("isLoggedIn", true)!;
          // Create new user in Firestore
          await firestore.collection('users').doc(user.uid).set({
            'uid': user.uid,
            'name': user.displayName ?? 'Unknown',
            'email': user.email ?? 'No email provided',
            'photoUrl': user.photoURL ?? '',
            'createdAt': FieldValue.serverTimestamp(),
          });
          print('New user created in Firestore.');
        } else {
          print('User already exists in Firestore.');
        }

        // Navigate to the next page
        if (!context.mounted) return;
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeftWithFade,
            child: AbsGenderPage(),
          ),
        );
      } catch (e) {
        print('Error during Google Sign-Up: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error during Google Sign-Up: $e')),
        );
      }
    }

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
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create an account",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff1e1e1e)),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                  ],
                ),
                Text(
                  "Join us and unlock a world of possibilities!",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff4a4545),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  width: 140,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/Ellipse 1-shadow (1).png"),
                        fit: BoxFit.contain),
                  ),
                ),
                // SizedBox(
                //   height: height * 0.00,
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          "Your Name",
                          style:
                              TextStyle(color: Color(0xff1e1e1e), fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xff2c67f2)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.0),
                            child: Icon(
                              Icons.person_outline,
                              color: Color(0xff2c67f2),
                              size: 27,
                            ),
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
                          hintText: "Ex. Saul Ramirez",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          "Email",
                          style:
                              TextStyle(color: Color(0xff1e1e1e), fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xff2c67f2)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.0),
                            child: Icon(
                              Icons.forward_to_inbox_outlined,
                              color: Color(0xff2c67f2),
                              size: 27,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xffAF001A)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Color(0xffAF001A),
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
                        height: 2,
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
                        controller: pswrdcontoller,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.0),
                            child: Icon(
                              Icons.lock_open,
                              color: Color(0xff2c67f2),
                              size: 27,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xffAF001A)),
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
                        height: 3,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize
                            .min, // Ensures it takes only needed space
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                            visualDensity: VisualDensity
                                .compact, // Reduces default padding
                            materialTapTargetSize: MaterialTapTargetSize
                                .shrinkWrap, // Shrinks tap area
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isChecked =
                                    !_isChecked; // Allow text tap to toggle checkbox
                              });
                            },
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "By continuing you accept our ",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffada4a5),
                                      fontWeight: FontWeight.w600)),
                              TextSpan(
                                  text: "Privacy policy and Term of use",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xffada4a5),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffada4a5),
                                  ))
                            ])),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>Homepage(username: namecontroller.text)));
                          if (nameController.text.isNotEmpty &&
                              emailController.text.isNotEmpty &&
                              pswrdcontoller.text.isNotEmpty) {
                            //  FirebaseAuth auth=FirebaseAuth.instance;
                            try {
                              var cred =
                                  await auth.createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: pswrdcontoller.text);
                              print(cred.user!.uid);
                              print("uid is ${cred.user!.uid}");
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString("uid", cred.user!.uid);
                              //FirebaseFirestore firestore= FirebaseFirestore.instance;
                              await firestore
                                  .collection("users")
                                  .doc(cred.user!.uid)
                                  .set({
                                "uid": cred.user!.uid,
                                "name": nameController.text,
                                "email": emailController.text,
                                'createdAt': FieldValue.serverTimestamp(),
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (c) => AbsGenderPage()));
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("error creating account")));
                            }

                            SharedPreferences mpref =
                                await SharedPreferences.getInstance();
                            mpref.setBool("login", true);
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                "please enter all the columns",
                              ),
                              backgroundColor: Colors.red,
                            ));
                            setState(() {});
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
                            "Register",
                            style: TextStyle(
                                letterSpacing: 0.2,
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Divider(
                              height: 4,
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
                              height: 4,
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
                            "Continue with",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xff1e1e1e)),
                            textAlign: TextAlign.center,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              signUpWithGoogle(context);
                            },
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(width: 2, color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                border:
                                    Border.all(width: 2, color: Colors.grey)),
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
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    child: AbsLoginPage()));
                          },
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "Already have an Account?  ",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff1e1e1e),
                                    fontWeight: FontWeight.w400)),
                            TextSpan(
                                text: "Login",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff2c67f2),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xff2c67f2)))
                          ])),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
