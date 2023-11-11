import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ipubook1/auth/sign-up.dart';
import 'package:ipubook1/screen/TabScreen.dart';

import '../constant.dart';

class SignIn extends StatefulWidget {
  static const String routName = 'signin';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var mypassword, myemail;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isloading = false;
  signIn() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myemail, password: mypassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("خطأ",
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Cairo')),
                  content: Text(
                      "لم يتم العثور على مستخدم لهذا البريد الإلكتروني",
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Cairo')),
                  backgroundColor: HexColor('#2198B7'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                );
              });
        } else if (e.code == 'wrong-password') {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text("خطأ",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Cairo')),
                    content: Text("كلمة مرور خاطئة لهذا المستخدم",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Cairo')),
                    backgroundColor: HexColor('#2198B7'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))));
              });
        }
      }
    } else {
      print("Not Vaild");
    }
  }

  // Future<void> _googleSignIn() async {
  //   GoogleSignInAccount googleSignInAccount = await GoogleSignIn().signIn();
  //   GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleSignInAccount.authentication;
  //   AuthCredential credential = GoogleAuthProvider.credential(
  //       idToken: googleSignInAuthentication.idToken,
  //       accessToken: googleSignInAuthentication.accessToken);
  //   UserCredential userCredential =
  //       await FirebaseAuth.instance.signInWithCredential(credential);
  //   print(userCredential.user!.displayName);

  //   if (userCredential.user != null) {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => TabScreen()));
  //   }
  // }

  static Future<Map?> googleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication? googleSignInAuthentaction =
          await googleSignInAccount.authentication;
      return {
        'name': googleSignInAccount.displayName,
        'email': googleSignInAccount.email,
        'token': googleSignInAuthentaction.accessToken,
        'google_id': googleSignInAccount.id,
        'image': googleSignInAccount.photoUrl
      };
    } catch (e) {
      print("ERORR");
      print(e);
    }
    return null;
  }

  googleLogin(BuildContext context) async {
    final result = await googleSignIn();
    if (result != null) {
      final login = await googleLogin(result['google_id']);
      if (login != null) {
        if (login['account_type'] == 'teacher') {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => TabScreen()));
        }
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              HexColor('02b2e4'),
              Color(0xFF61A4F1),
              Color(0xFF478DE0),
              HexColor('02b2e4'),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'تسجيل الدخول',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Cairo',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Center(child: Image.asset("images/logo.png")),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Form(
                      key: formstate,
                      child: Column(
                        children: [
                          Container(
                            decoration: kBoxDecorationStyle,
                            child: TextFormField(
                              onSaved: (val) {
                                myemail = val;
                              },
                              validator: (val) {
                                if (val!.length > 100) {
                                  return "لا يمكن أن يكون البريد الإلكتروني أكبر من 100 حرف";
                                }
                                if (val.length < 2) {
                                  return "لا يمكن أن يكون البريد الإلكتروني أقل من حرفين";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  hintText: "البريد الإلكتروني",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            decoration: kBoxDecorationStyle,
                            child: TextFormField(
                              onSaved: (val) {
                                mypassword = val;
                              },
                              validator: (val) {
                                if (val!.length > 100) {
                                  return "لا يمكن أن تكون كلمة المرور أكبر من 100 حرف";
                                }
                                if (val.length < 4) {
                                  return "لا يمكن أن تكون كلمة المرور أقل من 4 أحرف";
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.password_sharp),
                                  hintText: "كلمة السر",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1))),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                              width: 180,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                textColor: Colors.white,
                                onPressed: () async {
                                  setState(() {
                                    isloading = true;
                                  });
                                  var user = await signIn();
                                  setState(() {
                                    isloading = false;
                                  });
                                  if (user != null) {
                                    Navigator.of(context).pushReplacementNamed(
                                        TabScreen.routName);
                                  }
                                },
                                child: isloading
                                    ? SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: CircularProgressIndicator(
                                          color: Colors.blue,
                                          strokeWidth: 1.5,
                                        ))
                                    : Text(
                                        "تسجيل الدخول",
                                        style: TextStyle(
                                          color: Color(0xFF527DAA),
                                          letterSpacing: 1.5,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Cairo',
                                        ),
                                      ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            '- إذا لم يكن لديك حساب -',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Cairo'),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            width: 180,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(SignUp.routName);
                              },
                              child: Text(
                                "اشتراك",
                                style: TextStyle(
                                  color: Color(0xFF527DAA),
                                  letterSpacing: 1.5,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
