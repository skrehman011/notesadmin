import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesadmin/views/Screens/screen_log_in.dart';

import '../../controllers/registration_controller.dart';


class ScreenSignUp extends StatelessWidget {

  RegistrationController signUpController = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: MediaQuery.of(context).size.width,
        backgroundColor: Colors.white,
        // toolbarHeight: 90,
        shadowColor: Colors.transparent,
        elevation: 0,
        leading:TextButton(
            onPressed: () {
              Get.back();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Color(0xFF6A3EA1),
                ),
                Text(
                  "Back to login",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF6A3EA1),
                  ),
                ),
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 20, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Register",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  color: Colors.black,
                ),
              ).marginOnly(bottom: 10),
              Text(
                "And start taking notes",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFF827D89),
                ),
              ).marginOnly(bottom: 30),
              Text(
                "Full Name",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ).marginOnly(bottom: 15),
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 5),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Colors.grey.withOpacity(.5)),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: signUpController.nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Example:Jon Doe',
                    hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ).marginOnly(bottom: 30),
              Text(
                "Email Address",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ).marginOnly(bottom: 15),
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 5),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Colors.grey.withOpacity(.5)),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: signUpController.emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Example:Jhondoe@gmail.com',
                    hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ).marginOnly(bottom: 30),
              Text(
                "Password",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ).marginOnly(bottom: 15),
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 5),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Colors.grey.withOpacity(.5)),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: signUpController.passwordController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '*******',
                    hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  obscureText: true,
                ),
              ).marginOnly(bottom: 50),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                  EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Colors.grey.withOpacity(.5)),
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFF6A3EA1),
                  ),
                  child: TextButton(
                    onPressed: () {
                      signUpController.Signup();
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.white,
                          size: 25,
                        ),
                      ],
                    ),
                  )).marginOnly(bottom: 10),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFF6A3EA1),
                    ),
                    children: [
                      TextSpan(
                        text: 'Login here',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFF6A3EA1),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(ScreenLogIn());
                          },
                      ),
                    ],
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
