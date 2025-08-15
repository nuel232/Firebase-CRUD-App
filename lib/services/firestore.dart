import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get collaection of notes
  final CollectionReference notes = FirebaseFirestore.instance.collection(
    'notes',
  );

  //CREATE: add a new note
  Future<void> addNote(String note) {
    print("Saving note: $note");
    return notes.add({'note': note, 'timestamp': Timestamp.now()});
  }

  //READ: get notes from database
  Stream<QuerySnapshot> getNoteStream() {
    final noteStream = notes.orderBy('timestamp', descending: true).snapshots();

    return noteStream;
  }

  //UPDATE: update notes given a doc id
  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  //DELETE: delete notes given a doc id
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
