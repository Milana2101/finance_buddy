import 'package:finance_buddy/index.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: ObserverBuilder(
            controller: (context) => LoginController(context),
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Gap(100),
                  Text(
                    'LOG IN',
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
                      onTap: controller.loginUser,
                      child: Text(
                        'Log in',
                        style: context.textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  const Gap(30),
                  GestureDetector(
                    onTap: () => context.go(AppRouter.register),
                    child: Text(
                      'Forgot password? Reset password',
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
