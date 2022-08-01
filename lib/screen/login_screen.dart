import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fp1/screen/note_screen.dart';
import 'package:fp1/screen/signup_screen.dart';

import '../controller/auth_methods.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    CollectionReference ref = FirebaseFirestore.instance.collection('user');

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  
  
 
  
void loginUser() async{
    setState(() {
      isLoading = true;
    });

    String? result = await Auth_method.loginUser(
      
      email: emailController.text,
       password: passwordController.text);
  

  setState(() {
      isLoading = false;
    });

    if (result != "success") {
         Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const NoteScreen(),
        )
         );
    }
}

//  @override
//   void dispose(){
//     super.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//   }
  // void loginUser()async{
  //   setState(() {
  //     isLoading = true;
  //   });
  //   if()

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login screen'),
      centerTitle: true,
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children:  [
             TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter email',

              ), ),
            const SizedBox(
              height: 10,
            ),
             TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter passowrd',
              ),
            ),
             const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: (){

              loginUser();
             
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.black),
                ), 
                child: const Text('Login',style: TextStyle(fontSize: 25),),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Row(
                children: [
                  const Text('Do not have account ?  ',style: TextStyle(fontSize: 25),),
                  ElevatedButton(onPressed: (){
                    
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: 
                      ((context) => const SignUp())));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                  
                   child:const  Text('Sign in',style: TextStyle(fontSize: 25),
                   ),
                   ),
                ],
              ),
            ),
          ],
        ),

      ),
      ),
    );
  }
}