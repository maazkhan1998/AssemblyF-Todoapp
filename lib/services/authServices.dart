import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  Future<void> signUpUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> loginUser(String email,String password)async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    }
    on FirebaseAuthException catch(e){
      print(e);
      throw e;
    }
    catch(e){
      print(e);
      throw e;
    }
  }
}
