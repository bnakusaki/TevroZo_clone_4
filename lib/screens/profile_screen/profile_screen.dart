import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconly/iconly.dart';
import 'package:tevrozo_clone_four/screens/profile_screen/membership_card.dart';
import 'package:tevrozo_clone_four/screens/profile_screen/option_model.dart';
import 'package:tevrozo_clone_four/screens/profile_screen/section_model.dart';
import 'package:tevrozo_clone_four/shared/size_config.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);

    final l10n = AppLocalizations.of(context)!;

    List<ProfileSection> profileSections = [
      ProfileSection(
        title: l10n.accountDetails,
        options: [
          Option(
            title: l10n.detailProfile,
            description: l10n.informationAccont,
            icon: Icons.person_outline,
          ),
          Option(
            title: l10n.transactionHistory,
            description: l10n.yourTransaction,
            icon: CupertinoIcons.doc,
          ),
          Option(
            title: l10n.paymentAccount,
            description: l10n.manageYourAccount,
            icon: Icons.wallet_outlined,
          ),
        ],
      ),
      ProfileSection(
        title: l10n.settings,
        options: [
          Option(
            title: l10n.notification,
            description: l10n.yourNotificationSettings,
            icon: IconlyLight.notification,
          ),
        ],
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const MembershipCard(),
            Expanded(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final section = profileSections[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: sizeConfig.screenHorizontalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 10),
                          child: Text(
                            section.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 90.0 * section.options.length,
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: section.options.length,
                            itemBuilder: (context, index) {
                              final option = section.options[index];
                              return ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary.withOpacity(0.05),
                                  child: Icon(option.icon),
                                ),
                                title: Text(
                                  option.title,
                                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                                ),
                                subtitle: Text(option.description),
                                trailing: const Icon(Icons.chevron_right),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(height: 10);
                            },
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
                    height: 15,
                  );
                },
                itemCount: profileSections.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
