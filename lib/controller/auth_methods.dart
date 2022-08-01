import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Auth_method{
   static FirebaseAuth auth = FirebaseAuth.instance;
static final FirebaseFirestore firestore = FirebaseFirestore.instance;
 
  //signup
   static Future<String> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
   String result = 'Some error occoured';
    try{
      if(email.isNotEmpty
       && name.isNotEmpty 
       && password.isNotEmpty){
        UserCredential cred = await auth.createUserWithEmailAndPassword(
          email: email,
           password: password);
           final uid = cred.user!.uid;
          
           print('uid is $uid');
        await  FirebaseFirestore.instance.collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .set({
           'uid': uid,
          'name' : name,
          'email': email,
          'password': password,
          
       }).then((value) => {
                print("New account created"),
                
              });
        
        result = 'success';
      }
    } catch (err) {
      result = err.toString();
      print(err);
    
    }
    return result;
  }

    
  
  

  static Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Some error occoured';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'Successs';
      } else {
        res = 'Please enter all the fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}   