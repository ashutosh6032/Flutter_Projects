import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthImplementation {
  Future<String> getCurrentUser();
  Future<void> signOut();
}

class Auth implements AuthImplementation {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<String> getCurrentUser() async {
    User user = _firebaseAuth.currentUser!;
    return user.uid;
  }

  @override
  Future<void> signOut() async {
    _firebaseAuth.signOut();
  }
}
