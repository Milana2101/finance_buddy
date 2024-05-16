import 'package:finance_buddy/index.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          context.go(AppRouter.login);
        },
        child: Text('Log out'),
      ),
    );
  }
}
