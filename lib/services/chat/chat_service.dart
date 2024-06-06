import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  // instance firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //user stream
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        //individual user
        final user = doc.data();
        //return user
        return user;
      }).toList();
    });
  }

  //send message

  //get message
}
