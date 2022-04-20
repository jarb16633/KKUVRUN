import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:strava/pages/home.dart';
import 'package:flutter/material.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:loginsystem/model/profile.dart';
// import 'package:loginsystem/screen/welcome.dart';

import '../pages/profile.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
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
                title: const Text('Login'),
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
                            child: const Text("Login"),
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(35)),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: profile.email!,
                                          password: profile.password!)
                                      .then((value) {
                                    formKey.currentState?.reset();
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HomePage();
                                    }));
                                  });
                                } on FirebaseAuthException catch (e) {
                                  Fluttertoast.showToast(
                                      msg: e.message!,
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
