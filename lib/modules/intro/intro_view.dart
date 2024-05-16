import 'package:finance_buddy/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final Color? color;

  const CustomContainer({super.key, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: context.theme.iconTheme.color!,
        ),
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      child: child,
    );
  }
}

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const CustomButton({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: context.theme.iconTheme.color!),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: child,
      ),
    );
  }
}

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  static const _maxPoints = 6;
  int _index = 0;

  final _pageController = PageController();

  Widget _nextButton() {
    return CustomButton(
      onTap: () => context.go(AppRouter.register),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Get Started',
            style: context.textTheme.headlineSmall,
          ),
          const Gap(8),
          Icon(
            FontAwesomeIcons.arrowRight,
            size: 28,
            color: context.theme.iconTheme.color,
          ),
        ],
      ),
    );
  }

  List<Widget> _views() {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(FontAwesomeIcons.piggyBank, size: 100),
          const Gap(18),
          Text(
            'finance buddy'.toUpperCase(),
            style: context.textTheme.headlineMedium,
          ),
          // _nextButton(),
        ],
      ),
      Align(
        alignment: Alignment.center,
        child: Text(
          'Hello, my name is\nFinBuddy and i want you\nto walk through the app',
          style: context.textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Here you can easily\nadd your expenses\nfor any purchases,\nhouse rents or\nutilities.',
              style: context.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const Gap(20),
            Image.asset(
              Assets.imagesAddExpenses,
              width: 300,
              height: 290,
            ),
          ],
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Assets.imagesBarChart,
              width: 300,
              height: 290,
            ),
            const Gap(11),
            Text(
              'I will also help you to\nkeep track on your\nbudget with our\ninteractive diagrams.',
              style: context.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const Gap(120),
          ],
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'And of course, you\ncan message me\nwhenever you want\nand i will always\nanswer all your\nquestions.',
                style: context.textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const Gap(24),
              Align(
                alignment: Alignment.centerRight,
                child: CustomContainer(
                  color: context.scheme.primaryContainer.withOpacity(0.8),
                  child: Text(
                    'Hello, can you please\ngive me an advice how\nto save more money?',
                    style: context.textTheme.bodyLarge,
                  ),
                ),
              ),
              const Gap(12),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomContainer(
                  color: context.scheme.secondary.withOpacity(0.8),
                  child: Text(
                    'Hello.After reviewing all\nyour expenses? I noticed\nto spend a lot of money\non car.',
                    style: context.textTheme.bodyLarge,
                  ),
                ),
              ),
              const Gap(18),
              CustomContainer(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Type your message',
                      style: context.textTheme.bodyLarge,
                    ),
                    const Gap(12),
                    const Icon(FontAwesomeIcons.solidCircleUp),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'THANK YOU\nfor choosing',
            style: context.textTheme.headlineMedium,
          ),
          const Gap(80),
          const Icon(FontAwesomeIcons.piggyBank, size: 100),
          const Gap(18),
          Text(
            'finance buddy'.toUpperCase(),
            style: context.textTheme.headlineMedium,
          ),
          const Gap(100),
          SizedBox(
            width: 208,
            child: _nextButton(),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: _views(),
          ),
          if (_index != _maxPoints - 1)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60, left: 10, right: 10),
                child: Row(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        _maxPoints,
                        (index) {
                          final isSelected = _index == index;

                          return Container(
                            height: 15,
                            width: 15,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? context.scheme.primary
                                  : Colors.white,
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          if (_index == _maxPoints - 1) return;
                          _index++;
                          setState(() {});
                          _pageController.animateToPage(
                            _index,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeIn,
                          );
                        },
                        icon: const Icon(FontAwesomeIcons.arrowRight),
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
