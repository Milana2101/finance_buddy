import 'package:finance_buddy/index.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterController extends Controller {
  final BuildContext context;

  RegisterController(this.context);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void registerUser() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      context.go(AppRouter.home);
    } catch (e) {
      print(e);
    }
  }
}
