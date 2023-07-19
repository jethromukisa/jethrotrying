
import 'package:firebase_auth/firebase_auth.dart';
import '../models/theuser.dart';
import 'databases.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // create MyUser object based on User
  MyUser? _userFromUser(User user){
    return user != null? MyUser(uid:user.uid):null;
  }
  //auth change user stream
  Stream<MyUser?> get user {
    return _auth.authStateChanges()
        .map((User? user) => _userFromUser(user!));
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromUser(user!);
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }
//sign in with email & password
  Future signInwithEmailandPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      //create a new document for the user with the uid
       await DatabaseService(uid:user!.uid).updateUserData('New driver', 0, 0);

      return _userFromUser(user!);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

//register with email & password
  Future registerwithEmailandPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromUser(user!);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

//sign out
  Future signOut() async{
    try {
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }



}