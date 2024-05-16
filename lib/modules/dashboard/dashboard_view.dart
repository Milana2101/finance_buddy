import 'package:finance_buddy/index.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();
  }

  void _addExpense() async {
    final spending = await showDialog<Spending>(
      context: context,
      builder: (context) {
        final description = TextEditingController();
        final amount = TextEditingController();
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 300,
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: context.scheme.background,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                      controller: description,
                      title: 'Description',
                    ),
                    const Gap(10),
                    CustomTextField(
                      controller: amount,
                      title: 'Amount',
                    ),
                    const Gap(25),
                    CustomButton(
                      onTap: () {
                        context.pop(
                          description.text.isEmpty && amount.text.isEmpty
                              ? null
                              : Spending(
                                  date: DateTime.now(),
                                  description: description.text,
                                  amount: int.tryParse(amount.text) ?? 0,
                                ),
                        );
                      },
                      child: Text(
                        'Add expense',
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    if (spending == null) return;
    locator.get<DashboardController>().createExpense(spending);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ObserverBuilder(
      controller: (context) => DashboardController(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            children: [
              const Gap(15),
              // Text(
              //   'Hello, username',
              //   style: context.textTheme.headlineSmall,
              // ),
              // const Gap(25),
              Column(
                children: [
                  if (!controller.editBudget)
                    Row(
                      children: [
                        Text(
                          'Budget: ${controller.calculatedBudget}\$',
                          style: context.textTheme.titleLarge,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: controller.setBudget,
                          icon: const Icon(
                            FontAwesomeIcons.pencil,
                            size: 15,
                          ),
                        ),
                      ],
                    )
                  else
                    TextField(
                      controller: controller.budgetEditingController,
                      autofocus: true,
                      cursorHeight: 18,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        border: const OutlineInputBorder(),
                        isCollapsed: true,
                        suffix: Material(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: const CircleBorder(),
                          child: InkWell(
                            onTap: controller.setBudget,
                            child: const SizedBox(
                              height: 28,
                              width: 28,
                              child: Icon(
                                FontAwesomeIcons.check,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const Gap(30),
              Row(
                children: [
                  Text(
                    'Your expenses',
                    style: context.textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: _addExpense,
                    child: Text(
                      'Add expense',
                      style: context.textTheme.bodyLarge!.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.expenses.length,
                  itemBuilder: (context, index) {
                    final item = controller.expenses[index];
                    final formatter = DateFormat('yyyy-MM-dd');
                    final formattedDate = formatter.format(item.date);
                    return Container(
                      height: 60,
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        // border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(item.description),
                              Text(formattedDate),
                            ],
                          ),
                          const Spacer(),
                          Text('${item.amount}\$'),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
