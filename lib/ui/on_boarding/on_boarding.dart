import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:on_your_table_waiter/core/constants/lotti_assets.dart';
import 'package:on_your_table_waiter/ui/auth/login_screen.dart';
import 'package:on_your_table_waiter/ui/auth/register_screen.dart';
import 'package:on_your_table_waiter/ui/widgets/divider.dart';
import 'package:on_your_table_waiter/ui/widgets/buttons/custom_elevated_button.dart';

class OnBoarding extends ConsumerWidget {
  const OnBoarding({Key? key}) : super(key: key);
  static const route = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Lottie.asset(
              LottieAssets.food,
              width: size.width,
              height: size.height * 0.44,
            ),
            const CustomDivider(),
            AnimatedTextKit(
              totalRepeatCount: 1,
              animatedTexts: [
                TyperAnimatedText(
                  'On Your Table',
                  speed: const Duration(milliseconds: 100),
                  textStyle: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Bienvenido a la aplicación para meseros.',
                style: TextStyle(color: Colors.black87),
              ),
            ),
            const Spacer(),
            CustomElevatedButton(
              onPressed: () => handleOnLogin(context),
              child: const Text('Ingresar'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => handleOnRegister(context),
              child: const Text('Registrarse'),
            ),
            const CustomDivider(),
          ],
        ),
      ),
    );
  }

  void handleOnLogin(BuildContext context) => GoRouter.of(context).push(LoginScreen.route);
  void handleOnRegister(BuildContext context) => GoRouter.of(context).push(RegisterScreen.route);
}
