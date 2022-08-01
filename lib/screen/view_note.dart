import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fp1/screen/note_screen.dart';

class ViewNote extends StatefulWidget {
  const ViewNote({Key? key}) : super(key: key);

  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
 
NoteScreen ns = NoteScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('view notes'),
  
      ),

      body: Center(
        child: Column(
          children: [
           
          ],
        ),
      )
    

    


    );
  }
}