import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigInService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<GoogleSignInAuthentication> signIn() async {
    GoogleSignInAccount currentUser = _googleSignIn.currentUser;
    if (currentUser == null) {
      currentUser = await _googleSignIn.signInSilently();
    }
    if (currentUser == null) {
      currentUser = await _googleSignIn.signIn();
    }
    final GoogleSignInAuthentication auth = await currentUser.authentication;
    return auth;
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
