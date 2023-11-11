import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ipubook1/auth/sign-in.dart';
import 'package:ipubook1/screen/TabScreen.dart';

import '../constant.dart';

class SignUp extends StatefulWidget {
  static const String routName = 'signUp';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var myusername, mypassword, myemail;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
bool isloading=false;
  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: myemail, password: mypassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text(
                      "خطأ",
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Cairo'),
                    ),
                    content: Text("كلمة المرور ضعيفة",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Cairo')),
                    backgroundColor: HexColor('#2198B7'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))));
              });
        } else if (e.code == 'email-already-in-use') {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text("خطأ",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Cairo')),
                    content: Text("الحساب موجود بالفعل لهذا البريد الإلكتروني",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Cairo')),
                    backgroundColor: HexColor('#2198B7'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))));
              });
        }
      } catch (e) {
        print(e);
      }
    } else {}
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
            SizedBox(height: 50,),
            Text(
              'اشتراك',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Cairo',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 60,),
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
                            myusername = val;
                          },
                          validator: (val) {
                            if (val!.length > 100) {
                              return "لا يمكن أن يكون اسم المستخدم أكبر من 100 حرف";
                            }
                            if (val.length < 2) {
                              return "لا يمكن أن يكون اسم المستخدم أقل من حرفين";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "اسم المستخدم",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1))),
                        ),
                      ),
                      SizedBox(height: 20),
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
                              hintText: "البريد الالكتروني",
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
                              hintText: "كلمة المرور",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1))),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        width: 180,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                        textColor: Colors.white,
                        onPressed: () async {
                              setState(() {
                                isloading=true;
                              });
                          UserCredential response = await signUp();
                              setState(() {
                                isloading=false;
                              });
                          print("===================");
                          if (response != null) {

                            Navigator.of(context)
                                .pushReplacementNamed(TabScreen.routName);
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: Text(
                                        "خطأ",
                                        textAlign: TextAlign.right,
                                        style:
                                        TextStyle(color: Colors.white, fontFamily: 'Cairo'),
                                      ),
                                      content: Text("خطأ في ااشتراك",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              color: Colors.white, fontFamily: 'Cairo')),
                                      backgroundColor: HexColor('#2198B7'),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20.0))));
                                });
                          }
                          print("===================");
                        },
                        child:isloading? SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                              strokeWidth: 1.5,
                            )): Text(
                          "اشتراك",
                          style:  TextStyle(
                            color: Color(0xFF527DAA),
                            letterSpacing: 1.5,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      )),
                      SizedBox(height: 50,),
                      Text(
                        '- إذاكان لديك حساب -',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Cairo'
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        width: 180,
                        child: RaisedButton(

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          textColor: Colors.white,
                          onPressed: ()  {

                            Navigator.of(context)
                                .pushReplacementNamed(SignIn.routName);
                          },
                          child: Text(
                            "تسجيل الدخول",
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
      ),
    );
  }
}
