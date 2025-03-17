import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_gym_project_altamash/screens/UTILS/appcolors.dart';
import 'package:health_gym_project_altamash/screens/UTILS/textdecoration.dart';
import 'package:health_gym_project_altamash/screens/dob_screen.dart';
import 'package:health_gym_project_altamash/screens/userInfo/user_info_values.dart';
import 'package:page_transition/page_transition.dart';

class AbsGenderPage extends StatefulWidget {
  const AbsGenderPage({super.key});

  @override
  State<AbsGenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<AbsGenderPage> {
  String gender = "";
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
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Text("Let Us Know About Yourself....",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 26,
                        letterSpacing: 0.5,
                        height: 35.88 / 26,
                        color: Color(0xff1e1e1e),

                        //color: Color(0xff1e1e1e),
                        fontWeight: FontWeight.w900)),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 0.22,
                  height: height * 0.1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff55a2fa), // First color
                        Color(0xff2c67f2),
                      ],
                      begin: Alignment.topLeft, // Adjust gradient direction
                      end: Alignment.bottomRight,
                      stops: [0.3, 1.0],
                    ),
                    border: Border.all(width: 2, color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 1,
                          spreadRadius: 0,
                          color: Colors.grey)
                    ],
                    shape: BoxShape.circle,

                    color: AppColors.secondaryolor,
                    //borderRadius: BorderRadius.circular(width * 0.1)
                  ),
                  child: Text("Step 1",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: isLandscape ? width * 0.03 : width * 0.05)),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  "What is Your Gender ?",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      shadows: [Shadow(color: Colors.grey)],
                      fontSize: isLandscape ? width * 0.03 : width * 0.05),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: height * 0.33,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Image.asset("assets/images/male 1.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              //color: Colors.green,
                              height: height * 0.315,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child:
                                    Image.asset("assets/images/female 1.png"),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            gender == "male"
                                ? Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  )
                                : Container(),
                            //  gender=="male" ?  Icon(Icons.check,color: Colors.green,weight: 29,):null,
                            Text("I am",
                                style:
                                    mTextStyle12(mFontWeight: FontWeight.w700)),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Color(0xff2c67f2),
                              borderRadius: BorderRadius.circular(7)),
                          child: GestureDetector(
                            onTap: () {
                              gender = "male";
                              setState(() {});
                              UserInfoValues.gender = "male";
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                "Gender Saved as ${UserInfoValues.gender}",
                                style: TextStyle(color: Colors.green),
                              )));
                            },
                            child: Text(" Male",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isLandscape
                                        ? width * 0.03
                                        : width * 0.05)),
                          ),
                        )
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            gender == "female"
                                ? Icon(
                                    Icons.check,
                                    color: Colors.green,
                                    weight: 50,
                                  )
                                : Container(),
                            Text("I am",
                                style:
                                    mTextStyle12(mFontWeight: FontWeight.w700)),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Color(0xff2c67f2),
                              borderRadius: BorderRadius.circular(7)),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                gender = "female";
                              });
                              UserInfoValues.gender = "female";

//  ScaffoldMessenger.of(context)
//                                   .showSnackBar(SnackBar(
//                                       content: Text(
//                                 "Gender Saved as ${UserInfoValues.gender}",
//                                 style: TextStyle(color: Colors.green),
//                               )));
                            },
                            child: Text(" Female",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isLandscape
                                        ? width * 0.03
                                        : width * 0.05)),
                          ),
                        )
                      ],
                    )),
                  ],
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                GestureDetector(
                  onTap: () {
                    if (UserInfoValues.gender == "male" ||
                        UserInfoValues.gender == "female") {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              child: AbsScrollableCalendar()));
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //     content: Text(
                      //   "Gender Saved as ${UserInfoValues.gender}",
                      //   style: TextStyle(color: Colors.green),
                      // )));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        "Please Select gender",
                        style: TextStyle(color: Colors.red),
                      )));
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color(0xff2c67f2),
                        borderRadius: BorderRadius.circular(7)),
                    child: Text("Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                isLandscape ? width * 0.03 : width * 0.05)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
