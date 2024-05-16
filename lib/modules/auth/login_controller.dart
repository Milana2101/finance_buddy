import 'package:finance_buddy/index.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends Controller {
  final BuildContext context;

  LoginController(this.context);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      context.go(AppRouter.home);
    } catch (e) {
      print(e);
    }
  }
}
