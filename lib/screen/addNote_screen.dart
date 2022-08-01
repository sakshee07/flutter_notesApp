import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fp1/screen/note_screen.dart';

import '../models/note.dart';

class AddNote extends StatefulWidget {
Note? note;
  AddNote({Key? key, this.note}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  //static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController title = TextEditingController();
  late TextEditingController desc;

 CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("notes");


  void setUp() {
    if (widget.note != null) {
      title.text = widget.note?.title ?? "";
      desc.text = widget.note?.description ?? "";
    }
  }


  @override
  void initState() {
    desc = TextEditingController();
    setUp();
    super.initState();
  }


  @override
  void dispose() {
    title.dispose();
    desc.dispose(); //des
    super.dispose();
  }

  void addNote()  {
     if (widget.note != null) {
      ref
          .doc(widget.note?.id!)
          .update({'title': title.text, 'content': desc.text});
    } else {
      ref.add({'title': title.text, 'content': desc.text});
    }
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NoteScreen()));
  }

  void deleteNote() async {
    if (widget.note != null) {
      ref.doc(widget.note?.id!).delete();
    } 
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NoteScreen()));
  }
   
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AddNote'),
      
      ),

      body:
       Padding(
         padding: const EdgeInsets.all(20.0),
         child: Column(
          children:  [TextField(
              controller: title,
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
              TextField(
              controller: desc,
              decoration: const InputDecoration(
                hintText: 'Content',
              ),
            ), const SizedBox(
              height: 15,
            ),
            
          ElevatedButton(onPressed: (){ 
              print('saved');
              addNote();
              //Navigator.pop(context);
          }, 
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
            child:  const Text('Save',style: TextStyle(fontSize: 20),
                      ),
                      ),

            ElevatedButton(onPressed: (){ 
              print('deleted');
              deleteNote();
              //Navigator.pop(context);
          }, 
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
            child:  const Text('Delet',style: TextStyle(fontSize: 20),
                      ),
                      ),
                      ],
      ),
       )   
    );
  }
  
 

  
}
 