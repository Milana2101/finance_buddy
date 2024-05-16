import 'package:finance_buddy/index.dart';
import 'package:hive/hive.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _router = AppRouter();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router.router,
      theme: ThemeData(
        fontFamily: 'Jua',
        colorScheme: ColorScheme.dark(),
      ),
    );
  }
}
