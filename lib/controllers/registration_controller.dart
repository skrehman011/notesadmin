import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:notesadmin/views/Screens/screen_notes.dart';
import '../models/student_model.dart';


class RegistrationController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void Signup() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar('Alert', 'Fill all field');
    } else {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password).then((value) {

        emailController.clear();
        nameController.clear();
        passwordController.clear();

        Student user = Student(
            id: value.user!.uid,
            name: name,
            email: email,
            password: password
        );
        FirebaseAuth.instance.currentUser!.displayName;

        FirebaseFirestore.instance.collection('users').doc(user.id).set(user.toMap()).then((value) {
          Get.snackbar('Hurrah', 'Registered and data successfully Stored');
          Get.offAll(ScreenNotes());
        });
      }).catchError((error){
        Get.snackbar('Error', error.toString());
      });
    }
  }

  void Sigin() async{
    String email=emailController.text.trim();
    String password=passwordController.text.trim();
    if(email.isEmpty|| password.isEmpty){
      Get.snackbar('Alert', 'pleas all filled');

    }else{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
        Get.snackbar('Alert', 'Succesfully Login');
        Get.offAll(ScreenNotes());
      }).catchError((error){
        Get.snackbar('Alert', error.toString() );
      });
    }

  }
}
