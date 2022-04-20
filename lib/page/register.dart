import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:strava/page/sec_home-page.dart';
import 'package:strava/pages/profile.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:strava/data/firebase.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();

  // CollectionReference users = FirebaseFirestore.instance.collection('users');

  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text('ERROR'),
              ),
              body: Center(
                child: Text('${snapshot.error}'),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Register'),
              ),
              body: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          'E-mail',
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (String? email) {
                              profile.email = email;
                            },
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'Please enter e-mail'),
                              EmailValidator(
                                  errorText: 'Invalid e-mail format'),
                            ]),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter E-mail',
                            ),
                          ),
                        ),
                        const Text(
                          'Username',
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: TextFormField(
                            onSaved: (String? username) {
                              profile.username = username;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Username',
                            ),
                          ),
                        ),
                        const Text(
                          'Password',
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: TextFormField(
                            obscureText: true,
                            onSaved: (String? password) {
                              profile.password = password;
                            },
                            validator: RequiredValidator(
                                errorText: 'Please enter password'), //(value) {
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Password',
                            ),
                          ),
                        ),
                        SizedBox(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          child: ElevatedButton(
                            child: const Text("Register"),
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(35)),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState?.save();
                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: profile.email!,
                                    password: profile.password!,
                                  )
                                      .then((value) {
                                    formKey.currentState?.reset();
                                    Fluttertoast.showToast(
                                        msg: 'Create Account complete',
                                        gravity: ToastGravity.TOP);

                                    FirebaseFirestore.instance
                                        .collection('Userdata')
                                        .doc(value.user?.uid)
                                        .set({
                                      "email": value.user?.email,
                                      "username": profile.username,
                                      "password": profile.password,
                                      "distance": " ",
                                      "time": " ",
                                      "speed": " ",
                                    }).then((value) =>
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                                return SecLogin();
                                              }),
                                              (route) => false,
                                            ));
                                  });
                                } on FirebaseAuthException catch (e) {
                                  print(e.code);
                                  String message;
                                  if (e.code == 'email-already-in-use') {
                                    message =
                                        'This email is already in the system.';
                                  } else if (e.message == 'weak-password') {
                                    message =
                                        'Password should have more than 6 characters';
                                  } else {
                                    message = e.message!;
                                  }
                                  Fluttertoast.showToast(
                                      msg: message,
                                      gravity: ToastGravity.CENTER);
                                }
                              }
                            },
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
    // )
  }
}
