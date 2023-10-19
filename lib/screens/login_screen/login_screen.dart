import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tevrozo_clone_four/assets.dart';
import 'package:tevrozo_clone_four/screens/home_screen.dart';
import 'package:tevrozo_clone_four/screens/login_screen/auth_text_fields.dart';
import 'package:tevrozo_clone_four/screens/login_screen/federated_auth_buttons.dart';
import 'package:tevrozo_clone_four/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    handleLogInButton() {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
    }

    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
        child: Column(children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(ImagePaths.defaultAvatar),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
            child: Text(
              l10n.logInScreenWelcomeMessage,
              style:
                  Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            l10n.logInScreenGeneralHint,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          ...List.generate(authTextFields.length, (index) {
            final authField = authTextFields[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(authField.prefixIcon),
                  hintText: authField.hintText,
                  suffixIcon: Icon(authField.suffixIcon),
                ),
              ),
            );
          }),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(l10n.forgotPasswordButtonLable),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: FilledButton(
              onPressed: handleLogInButton,
              child: Text(l10n.logInButtonLable),
            ),
          ),
          Row(
            children: [
              const Expanded(child: Divider(height: 90)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(l10n.orLogInWith),
              ),
              const Expanded(child: Divider()),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                federatedAuthButtons.length,
                (index) {
                  final button = federatedAuthButtons[index];
                  return Chip(
                    avatar: Image(
                      height: double.infinity,
                      width: double.infinity,
                      image: AssetImage(button.imagePath),
                      fit: BoxFit.cover,
                    ),
                    label: Text(
                      button.label,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  );
                },
              )),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.dontHaveAnAccount),
              TextButton(onPressed: () {}, child: Text(l10n.signUpTextButtonLable)),
            ],
          )
        ]),
      ),
    );
  }
}
