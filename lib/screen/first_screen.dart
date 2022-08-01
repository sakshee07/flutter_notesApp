// ignore: file_names
import 'package:flutter/material.dart';
import 'package:fp1/screen/login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column (
          children:  [
             const Padding (
               padding:  EdgeInsets.all(18.0),
               child: Text('Welcome to notes App',style: TextStyle(fontSize: 20),),
             ),
             const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/cover.png"),
                ),
              ),
            ),
            ),
            const SizedBox(
              height: 10,
            ),
           
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push( 
                MaterialPageRoute(builder:
                 ((context) => const LoginScreen())));
             },
             style: ButtonStyle(
                      backgroundColor: 
                      MaterialStateProperty.all(Colors.black),),
              child: const Text('Go ahead to login' ,style: TextStyle(fontSize: 20),),),
          ],
        ),
      ),
    );
  }
}