import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';

import 'firebase_options.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instanceFor(app: app);

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      AppRouter.isAuth = false;
      print('User is currently signed out!');
    } else {
      AppRouter.isAuth = true;
      print('User is signed in!');
    }
  });

  await localStorage.init();
  Hive.registerAdapter(SpendingAdapter());

  runApp(const App());
}
