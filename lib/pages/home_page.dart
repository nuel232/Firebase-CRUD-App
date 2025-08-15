import 'package:flutter/material.dart';
import 'package:onlinedatabase/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //get firestore service
  final FirestoreService firestoreService = FirestoreService();
  //text controller
  final TextEditingController textController = TextEditingController();
  //open a dialog box to add an note
  void openNoteBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        //text user input
        content: TextField(controller: textController),
        actions: [
          //button to save
          ElevatedButton(
            onPressed: () {
              //add a new note
              firestoreService.addNote(textController.text);

              //clear the box
              textController.clear();

              //close the box
              Navigator.pop(context);
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text('NOTES', style: TextStyle(color: Colors.white)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: Icon(Icons.add),
      ),
      body: Column(children: []),
    );
  }
}
