import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  //sign in
  Future<UserCredential> signInWIthEmailPassword(String email ,password) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password,);
      //sign user in
      _firestore.collection( "Users" ) .doc(userCredential.user!.uid).set(
          {
            'uid': userCredential.user!.uid,
            'email':email,
          }
      );
      return userCredential;
    }on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

  //sign up
  Future<UserCredential> signUpWIthEmailPassword(String email ,password)  async{
    try{
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
      //save user in seperate doc
      _firestore.collection( "Users" ) .doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email':email,
        }
      );
      return userCredential;
    } on FirebaseAuthException catch(e){
      throw Exception(e.code);

    }
}


  //sign out
Future<void> signOut()async{
    return await _auth.signOut();
}


  // Get current user using FirebaseAuth instance
  User? getCurrentUser() {
  return FirebaseAuth.instance.currentUser;
  }

  // ... other methods ...
  }



  //errors
