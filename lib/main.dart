import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fp1/screen/first_screen.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();

  runApp(MaterialApp(home: MyWidget(),));
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
   return  MaterialApp(
    title: 'NOTES APP',
    theme: ThemeData.dark().copyWith(
      primaryColor: Colors.white,
    ),
    home: const HomePage(),
     );
   }
}