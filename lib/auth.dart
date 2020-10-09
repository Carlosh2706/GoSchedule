import 'package:firebase_auth/firebase_auth.dart';
import 'package:startup_database/services/database.dart';
import 'package:startup_database/user.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //Create user obj based on FirebaseUser
  UserX _userFromFirebaseUser(User user) {
    return user != null ? UserX(uid: user.uid) : null;
  }

  //Auth change user stream
  Stream<UserX> get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebaseUser);
  }

  //Sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      User user  = result.user;
      return _userFromFirebaseUser(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }
  //Register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User user  = result.user;

      //Create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData('0', 'new crew member', 100);

      return _userFromFirebaseUser(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }

  //Sign out
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}