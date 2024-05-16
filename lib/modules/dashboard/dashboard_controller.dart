import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_buddy/index.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardController extends Controller {
  final _firestore = FirebaseFirestore.instance;

  late DocumentReference _currentUser;

  final budgetEditingController = TextEditingController();

  String userName = 'name';
  bool editBudget = false;

  List<Spending> expenses = [];

  int get calculatedBudget {
    int currentBudget = int.tryParse(budgetEditingController.text) ?? 0;

    if (expenses.isNotEmpty) {
      for (var expense in expenses) {
        currentBudget -= expense.amount;
      }
    }

    return currentBudget;
  }

  @override
  void onInit() {
    super.onInit();
    _initializeDatabase();
  }

  void setBudget() async {
    editBudget = !editBudget;
    update();

    if (!editBudget) {
      await _currentUser.set({
        'budget': budgetEditingController.text,
      });
    }
  }

  void createExpense(Spending spending) async {
    expenses.add(spending);

    _currentUser.update({
      'expenses': expenses.map((e) => e.toJson()),
    });
  }

  void _initializeDatabase() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    _currentUser = _firestore.collection('users').doc(currentUser!.uid);

    final userData = (await _currentUser.get()).data() as Map?;

    if (userData == null) {
      print('Creating user data');
      await _currentUser.set({
        'budget': 0,
        'expenses': [],
      });
    }

    expenses = List.from(userData?['expenses'] ?? [])
        .map((e) => Spending.fromJson(e))
        .toList();

    budgetEditingController.text = userData?['budget'] ?? '0';

    update();
  }
}
