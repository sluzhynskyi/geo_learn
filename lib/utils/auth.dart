import 'package:firebase_auth/firebase_auth.dart';


  
class Auth{
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Stream<User?> get user => _firebaseAuth.authStateChanges();
  
  static Future<User?> signIn(String email, String password) async {
    UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return result.user;
  }

  static Future<User?> currentUser()async{
    return _firebaseAuth.currentUser;
  }

  static Future<User?> signUp(String email, String password) async {
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return result.user;
  }

  static Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }


}