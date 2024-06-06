import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //instancia de FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  //sing in
  Future<UserCredential> singInWhitEmailAndPassword(String email, password) async {
    try {
      //sing user in
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password,
        );

        //guardar user en firestore

        _firestore.collection("Users").doc(userCredential.user!.uid).set({
          'uid':userCredential.user!.uid,
          'email':email,  
        });
      return userCredential;
    } on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }

  //sing up
  Future<UserCredential> singUpWhitEmailAndPassword(String email, password) async {
    try {
      //crear user
      UserCredential userCredential = 
        await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password,
        );

        //guardar user en firestore

        _firestore.collection("Users").doc(userCredential.user!.uid).set({
          'uid':userCredential.user!.uid,
          'email':email,  
        });
      return userCredential;
    } on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }

  //sing out
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  //errors
}