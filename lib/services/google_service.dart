import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleService {

   FirebaseAuth auth = FirebaseAuth.instance;
   GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
      "636518506767-29fgm8ptqh6ppld3q7hhqn359g3gpjvl.apps.googleusercontent.com");
  //Google Sign In
  Future<void> handleSignIn() async {
    try {
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

  Future<void> handleSignOut() async {
    try {} catch (e) {
      print("error sign out $e");
    }
    await googleSignIn.signOut();
    await auth.signOut();
  }
}
