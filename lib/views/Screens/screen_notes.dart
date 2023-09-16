import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesadmin/models/student_model.dart';
import 'package:notesadmin/views/Screens/screen_selected_user_note.dart';

import '../../models/notes.dart';

class ScreenNotes extends StatefulWidget {
  // var students;

  @override
  State<ScreenNotes> createState() => _ScreenNotesState();

// ScreenNotes({
//   required this.students,
// });
}

class _ScreenNotesState extends State<ScreenNotes> {
  var selectedUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // toolbarHeight: 80,
          centerTitle: true,
          shadowColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Home',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
        ),
        body: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 33, top: 5),
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    List<Student> users = snapshot.data!.docs
                        .map((e) =>
                            Student.fromMap(e.data() as Map<String, dynamic>))
                        .toList();
                    // var selectedUser = FirebaseAuth.instance.currentUser!.uid;
                    return (users.isEmpty)
                        ? Center(
                            child: Text('No users available'),
                          )
                        : Container(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 15,
                              right: 5,
                              bottom: 10,
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(0xFF6A3EA1),
                            ),
                            child: DropdownButton<Student>(
                              dropdownColor: Colors.white,
                              underline: SizedBox(),
                              hint: Text(
                                'Select the user',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              style: TextStyle(
                                  textBaseline: TextBaseline.ideographic,
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                              icon: SizedBox(),
                              value: selectedUser,
                              // You can set a selected value if needed
                              items: users.map((Student user) {
                                return DropdownMenuItem<Student>(
                                  value: user,
                                  child: Text(user.name),
                                );
                              }).toList(),
                              onChanged: (Student? newValue) {
                                setState(() {
                                  selectedUser = newValue!;
                                  if (newValue == selectedUser) {
                                    // FirebaseFirestore.instance
                                    //     .collection('notes')
                                    //     .where('userId',
                                    //         isEqualTo: FirebaseAuth
                                    //             .instance.currentUser!.uid)
                                    //     .snapshots();
                                    Get.to(ScreenSelectedUserNote());
                                  }
                                });
                              },
                            ),
                          );
                  },
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('notes')
                        // .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: CircularProgressIndicator.adaptive());
                      }
                      List<Notes> notes = snapshot.data!.docs
                          .map((e) =>
                              Notes.fromMap(e.data() as Map<String, dynamic>))
                          .toList();
                      return (notes.isEmpty)
                          ? Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                              ),
                              child: Center(child: Text('No Notes available')),
                            )
                          : ListView.builder(
                              itemCount: notes.length,
                              itemBuilder: (BuildContext context, int index) {
                                Notes note = notes[index];
                                return GestureDetector(
                                  onTap: () {
                                    // Get.to(ScreenSavedNotes(notes: note,));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: 10,
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    height: 101,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF6A3EA1),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15,
                                          bottom: 5,
                                          top: 10,
                                          right: 40),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            maxLines: 1,
                                            note.title,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ).marginOnly(bottom: 10),
                                          Text(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            note.note,
                                            style: TextStyle(
                                                color: Color(0xFFEFE9F7),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ).marginOnly(bottom: 10),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                    },
                  ),
                )
              ],
            )));
  }
}
