import 'package:finance_buddy/index.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.title,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.titleMedium,
        ),
        const Gap(4),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: ObserverBuilder(
            controller: (context) => RegisterController(context),
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Gap(100),
                  Text(
                    'CREATE AN ACCOUNT',
                    style: context.textTheme.headlineSmall,
                  ),
                  const Gap(30),
                  CustomTextField(
                    controller: controller.emailController,
                    title: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const Gap(20),
                  CustomTextField(
                    controller: controller.passwordController,
                    title: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  const Gap(45),
                  SizedBox(
                    width: 120,
                    child: CustomButton(
                      onTap: controller.registerUser,
                      child: Text(
                        'Sign up',
                        style: context.textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  const Gap(30),
                  GestureDetector(
                    onTap: () => context.go(AppRouter.login),
                    child: Text(
                      'Have an existing account? Log in',
                      style: context.textTheme.bodyLarge!.copyWith(
                          // color: context.scheme.
                          ),
                    ),
                  ),
                  Gap(MediaQuery.of(context).size.height / 7),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(FontAwesomeIcons.piggyBank, size: 50),
                      const Gap(18),
                      Text(
                        'finance buddy'.toUpperCase(),
                        style: context.textTheme.headlineMedium,
                      ),
                      // _nextButton(),
                    ],
                  ),
                  const Gap(30),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
