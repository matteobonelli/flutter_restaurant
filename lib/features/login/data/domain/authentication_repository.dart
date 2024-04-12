import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:project_x/features/login/presentation/pages/login_screen.dart';
import 'package:project_x/features/menu/presentation/pages/menu_view.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const MenuView());
  }

  Future<String?> loginWithEmailAndPassword(String email,
      String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    return null;
  }


  Future<void> logout() async => await _auth.signOut();
}
