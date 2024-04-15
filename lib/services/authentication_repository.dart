import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:project_x/features/login/presentation/pages/login_screen.dart';
import 'package:project_x/features/menu/presentation/pages/menu_view.dart';
import 'package:project_x/utils/firestore_helper.dart';

import '../features/registration/data/models/user.dart';

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
    user == null ? Get.offAllNamed("/login") : Get.offAllNamed("/menu");
  }

  Future<void> registerWithEmailAndPassword(
      String email, String password, Users newUser) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
            final id = value.user?.uid;
            await FirestoreHelper.createUser(newUser, id);
            await FirestoreHelper.createCart(id);
      });
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (_) {}
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
