import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleService {
  //Google Sign In
  Future<void> handleSignIn() async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final GoogleSignIn googleSignIn = GoogleSignIn(
          clientId:
              "636518506767-29fgm8ptqh6ppld3q7hhqn359g3gpjvl.apps.googleusercontent.com");

      GoogleSignInAccount? userGoogle = await googleSignIn.signIn();
      if (userGoogle != null) {
        GoogleSignInAuthentication googleAuth = await userGoogle.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        await auth.signInWithCredential(credential);
      }
    } catch (e) {
      print("Error sign in Google $e");
    }
  }

  // Future<void> handleSignOut() async {
  //   try {} catch (e) {
  //     print("error sign out $e");
  //   }
  //   await _googleSignIn.signOut();
  //   await _auth.signOut();
  // }
}
