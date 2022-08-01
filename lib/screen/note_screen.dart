import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fp1/screen/addNote_screen.dart';
import 'package:fp1/screen/label_screen.dart';
import 'package:fp1/screen/reminder_screen.dart';
import '../models/note.dart';
import '../widgets/note_card.dart';


class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {

  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("notes");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('MyNotes'),
      ),
      drawer: Drawer(
  
        child: ListView(
          children:  [
            // DrawerHeader(child: Text('Notes Keep'),
            // ),
            ListTile(
              leading: Icon(Icons.note),
              title: Text('Notes Keep',style: TextStyle(fontSize: 40),),
              // we should go on notes screen we have notes
            ),
            
            ListTile(
              leading: Icon(Icons.note_add),
              title: Text('Notes',style: TextStyle(fontSize: 20),),
              onTap: (){Navigator.pop(context);}
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Reminders',style: TextStyle(fontSize: 20),),
              onTap: (){Navigator.push(context,
              MaterialPageRoute(builder: (context) => REminderScreen()));},
            ),
            ListTile(
              leading: Icon(Icons.label),
              title: Text('Create new label',style: TextStyle(fontSize: 20),),
              onTap: (){
                MaterialPageRoute(builder: (context) => LabelScreen());
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting',style: TextStyle(fontSize: 20),),
            ),
            
          ],
        ),
      ),
     
    floatingActionButton: FloatingActionButton(
onPressed: (){
  Navigator.push(
            context, MaterialPageRoute(
              builder: ((context) =>  AddNote()
            ),
            ),
            );
        },
        backgroundColor: Colors.white,
child: (const Icon(Icons.add)),
       ),

body: 


  FutureBuilder<QuerySnapshot>(
        future: ref.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.docs.length == 0) {
              return const Center(
                child: Text(
                  "You have no saved Notes !",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                
                final title =
                    snapshot.data!.docs[index].get("title") ?? "default";
                final id = snapshot.data!.docs[index].id;
                final description =
                    snapshot.data!.docs[index].get("content") ?? "default";

                final data = snapshot.data!.docs[index].data();

               
                final note = Note(id: id, title: title, description: description);
                /////////////
                return NoteCard(note: note);
              },
            );
          } else {
            return const Center(
              child: Text("Loading Content..."),
            );
          }
        },
      ),
    );
  }
}
