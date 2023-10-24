import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:tevrozo_clone_four/screens/login_screen/auth_text_fields.dart';
import 'package:tevrozo_clone_four/screens/login_screen/federated_auth_buttons.dart';
import 'package:tevrozo_clone_four/shared/assets.dart';
import 'package:tevrozo_clone_four/shared/routes.dart';
import 'package:tevrozo_clone_four/shared/size_config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final sizeConfig = SizeConfig(context);
    final heightBlocks = sizeConfig.blockSizeVertical();
    final widthBlocks = sizeConfig.blockSizeHorizontal();

    final textStyle = Theme.of(context).textTheme;

    final List<AuthTextField> authTextFields = [
      AuthTextField(
        prefixIcon: IconlyLight.message,
        hintText: l10n.logInEmailTextFieldHint,
        suffixIcon: null,
      ),
      AuthTextField(
        prefixIcon: IconlyLight.lock,
        hintText: l10n.logInPasswordTextFieldHint,
        suffixIcon: IconlyLight.hide,
      ),
    ];

    final List<FederatedAuthButtonModel> federatedAuthButtons = [
      FederatedAuthButtonModel(
        imagePath: ImagePaths.appleLogo,
        label: l10n.appleButtonLable,
        onPressed: () {},
      ),
      FederatedAuthButtonModel(
        imagePath: ImagePaths.googleLogo,
        label: l10n.googleButtonLable,
        onPressed: () {},
      ),
    ];

    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: sizeConfig.screenHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: widthBlocks * 11.0,
                backgroundImage: AssetImage(ImagePaths.defaultAvatar),
              ),
              Padding(
                padding: EdgeInsets.only(top: heightBlocks * 2.82, bottom: heightBlocks * 1.5),
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
                style: textStyle.bodyLarge,
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
                  onPressed: () => context.goNamed(RouteNames.home),
                  child: Text(l10n.logInButtonLable),
                ),
              ),
              Row(
                children: [
                  Expanded(child: Divider(height: heightBlocks * 10)),
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
              SizedBox(height: heightBlocks * 14),
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
