import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookSigInService {
  final FacebookLogin _facebookLogin = new FacebookLogin();

  Future<FacebookLoginResult> signIn() async {
    var result = await _facebookLogin.logInWithReadPermissions(['email']);
    return result;
  }

  Future<void> signOut() async {
    await _facebookLogin.logOut();
  }
}
