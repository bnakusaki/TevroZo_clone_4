import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tevrozo_clone_four/assets.dart';
import 'package:tevrozo_clone_four/screens/home_screen/home_screen.dart';
import 'package:tevrozo_clone_four/screens/login_screen/auth_text_fields.dart';
import 'package:tevrozo_clone_four/screens/login_screen/federated_auth_buttons.dart';
import 'package:tevrozo_clone_four/shared/size_config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final sizeConfig = SizeConfig(context);
    final heightBlocks = sizeConfig.blockSizeHorizontal();
    final widthBlocks = sizeConfig.blockSizeVertical();

    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: sizeConfig.screenHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: widthBlocks * 6,
                backgroundImage: AssetImage(ImagePaths.defaultAvatar),
              ),
              Padding(
                padding: EdgeInsets.only(top: heightBlocks * 3, bottom: heightBlocks * 1.5),
                child: Text(
                  l10n.logInScreenWelcomeMessage,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                l10n.logInScreenGeneralHint,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: heightBlocks * 3.4),
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
                padding: EdgeInsets.only(top: heightBlocks * 1.2),
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
                  },
                  child: Text(l10n.logInButtonLable),
                ),
              ),
              Row(
                children: [
                  Expanded(child: Divider(height: heightBlocks * 15)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(l10n.orLogInWith),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              Row(
                mainAxisAlignment: MediaQuery.sizeOf(context).width > 800
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.spaceBetween,
                children: List.generate(
                  federatedAuthButtons.length,
                  (index) {
                    final button = federatedAuthButtons[index];
                    return OutlinedButton(
                      onPressed: button.onPressed,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            button.imagePath,
                            height: 25,
                            fit: BoxFit.cover,
                            width: 25,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            button.label,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: heightBlocks * 30),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(l10n.dontHaveAnAccount),
                  TextButton(onPressed: () {}, child: Text(l10n.signUpTextButtonLable)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
