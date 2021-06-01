import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_usage/Common/functions.dart';
import 'package:water_usage/Screens/auth/signup_screen.dart';
import 'package:water_usage/Screens/home/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color: Color(0xff4137f0),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                /// Circular logo container
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: size.height*0.123,bottom: size.height*0.1),
                  width: size.width*0.3,
                 height: size.width*0.3,
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: Colors.white,
                 ),
                  child: Text("LOGO",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800
                  ),),
                ),

                Container(
                  alignment: Alignment.bottomCenter,
                  width: size.width,
                  height: size.height*0.7,
                  decoration: BoxDecoration(
                    color: Color(0xff382fe2),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))
                  ),
                  child:   Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: size.height*0.024),
                        alignment: Alignment.topCenter,
                        width: size.width,
                        height: size.height*0.7,
                        child: Text("Login",style: GoogleFonts.cabin(color: Colors.white,
                        fontSize: size.width*0.06,
                        fontWeight: FontWeight.w600),),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
                        width: size.width,
                        height: size.height*0.62,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textField(hintText: "Email Address",
                            size: size,icon: Icons.email_outlined,
                            controller: _controllerEmail,
                            ),
                            SizedBox(
                              height: size.height*0.05,
                            ),
                            textField(hintText: "Password",
                              size: size,icon: Icons.lock,
                            controller: _controllerPass),
                            Container(
                              width: size.width,
                              margin: EdgeInsets.only(top: size.height*0.04),
                              alignment: Alignment.centerRight,
                              child:Text("Forgot password?",style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: size.width*0.035,
                                fontWeight: FontWeight.w600
                              ),),

                            ),

                            InkWell(
                              onTap: (){
                                loginApp(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: size.height*0.03),
                                alignment: Alignment.center,
                                width: size.width*0.8,
                                height: size.height*0.08,
                                decoration: BoxDecoration(
                                  color: Color(0xff382fe2),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                              child: Text("LOG IN",style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: size.width*0.05,
                                color: Colors.white
                              ),),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                print("kashif");
                                screenPush(context, SignUpScreen());

                              },
                              child: Container(
                                margin: EdgeInsets.only(top: size.height*0.04,bottom: size.height*0.1),
                                child:RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Don't have an account?",
                                        style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: size.width*0.035
                                        ),
                                      ),
                                      TextSpan(
                                        text: "  Sign Up",
                                        style: GoogleFonts.roboto(
                                            color: Color(0xff382fe2),
                                            fontSize: size.width*0.035,
                                          fontWeight: FontWeight.w900
                                        ),
                                      ),
                                    ]
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );

  }

  Widget textField({Size size, String hintText, var icon, var controller}){
   return TextField(
     controller: controller,
      decoration: InputDecoration(
          prefixIcon: Icon(icon,color: Colors.black,),
          hintText: "$hintText",
          hintStyle: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: size.width*0.037,
          )
      ),
    );
  }


  loginApp(BuildContext context) {
    if(EmailValidator.validate(_controllerEmail.text.replaceAll(" ", "")) &&
       _controllerPass.text.length>5){
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: _controllerEmail.text.replaceAll(" ", ""), password: _controllerPass.text.replaceAll(" ", ""))
          .then((value) {
        if (true) {
          screenPushRep(context, HomeScreen());
        } else {
          final snackBar = SnackBar(
            content: Text("Login failed"),
            duration: Duration(milliseconds: 1300),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    }else{
      final snackbar = SnackBar(content: Text("Email is not valid or password is short",
      style: TextStyle(
        color: Colors.white
      ),),
      backgroundColor: Colors.red,
      duration: Duration(
        milliseconds: 1300
      ),);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }

  }
}
