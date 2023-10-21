import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tevrozo_clone_four/screens/home_screen/serivce_model.dart';
import 'package:tevrozo_clone_four/shared/assets.dart';
import 'package:tevrozo_clone_four/shared/size_config.dart';

class MembershipCard extends StatelessWidget {
  const MembershipCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    final l10n = AppLocalizations.of(context)!;

    final sizeConfig = SizeConfig(context);

    List<ServiceModel> personalStats = [
      ServiceModel(icon: Icons.stacked_bar_chart, lable: l10n.myPoints),
      ServiceModel(icon: Icons.receipt, lable: l10n.myvoucher),
      ServiceModel(icon: Icons.diamond, lable: l10n.myMission),
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: sizeConfig.screenHorizontalPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.primary,
            Colors.pink.withOpacity(0.7),
          ],
          stops: const [0.8, 1.0],
        ),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Badge(
                backgroundColor: color.onPrimary,
                alignment: Alignment.topLeft,
                smallSize: 20,
                child: Container(
                  height: 65,
                  width: 65,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color.onPrimary,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(ImagePaths.female_1),
                    radius: 30,
                  ),
                ),
              ),
              const SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mihceal W.',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: color.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    l10n.premiumLable,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: color.onPrimary,
                        ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20.0),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(personalStats.length, (index) {
                  final service = personalStats[index];

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.05),
                        child: Icon(service.icon, color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(height: 5),
                      Text(service.lable,
                          style: const TextStyle(
                            fontSize: 11,
                          )),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
