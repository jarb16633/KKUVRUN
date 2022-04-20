// import 'dart:html';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'sec_home-page.dart';
import 'package:strava/pages/profile.dart';
import 'package:image_picker/image_picker.dart';

class AccPage extends StatefulWidget {
  @override
  State<AccPage> createState() => _AccPageState();
}

class _AccPageState extends State<AccPage> {
  // const Accpage({Key? key}) : super(key: key);
  late PickedFile _imageFile;
  bool load = false;
  Profile profile = Profile();
  // Future<null> getName() async {
  //   DocumentSnapshot document = await FirebaseFirestore.instance.collection('Userdata').doc(FirebaseUser)
  // }
  // final String userUid;
  // GetUserName(this.userUid);
  final auth = FirebaseAuth.instance;
  final userid = FirebaseAuth.instance.currentUser!.uid;
  User uid = FirebaseAuth.instance.currentUser!;

  final ImagePicker picker = ImagePicker();

  CollectionReference users = FirebaseFirestore.instance.collection('Userdata');
  TextEditingController mycontroller = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Userdata').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) Text('load data');
            return Center(
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 20),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomSheet()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 50,
                          // backgroundColor: Colors.lightBlue,
                          backgroundImage: load == false
                              ? AssetImage("images/LoginPage_KKUVRUN.png")
                                  as ImageProvider
                              : FileImage(File(_imageFile.path)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 20),
                      child: Text(
                        "Your email : ${auth.currentUser!.email!}",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Name :   ${snapshot.data?.docs[0]['username']} ',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('New Username'),
                                              content: TextField(
                                                controller: mycontroller,
                                                autofocus: true,
                                                decoration: InputDecoration(
                                                    hintText:
                                                        'Enter New Username'),
                                              ),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      FirebaseFirestore.instance
                                                          .collection(
                                                              'Userdata')
                                                          .doc(FirebaseAuth
                                                              .instance
                                                              .currentUser!
                                                              .uid)
                                                          .update({
                                                        'username':
                                                            mycontroller.text
                                                      }).then((value) => null);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Confirm'))
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(Icons.edit))
                                ],
                              ),
                            ],
                          );
                        }),
                    ElevatedButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return SecLogin();
                            }),
                            (route) => false,
                          );
                        },
                        child: Text('Log-out')),
                  ]),
            );
          },
        ));
  }

  Widget bottomSheet() {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(children: [
          Text(
            'Choose Profile photo',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  choosePhoto(ImageSource.gallery);
                },
                label: Text('Gallery'),
              )
            ],
          ),
        ]));
  }

  void choosePhoto(ImageSource source) async {
    final pickedFile = await picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile!;
      load = true;
      print("this is file path ${_imageFile.path}");
    });
  }

  // chooseImg() async {
  //   XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (file == null) return;
  //
  //   file = File(file.path);
  //}
}
