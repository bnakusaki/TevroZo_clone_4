import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconly/iconly.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tevrozo_clone_four/screens/home_screen/insight_card.dart';
import 'package:tevrozo_clone_four/screens/home_screen/insights_model.dart';
import 'package:tevrozo_clone_four/screens/home_screen/promotion_card.dart';
import 'package:tevrozo_clone_four/screens/home_screen/search_field.dart';
import 'package:tevrozo_clone_four/screens/home_screen/serivce_model.dart';
import 'package:tevrozo_clone_four/screens/home_screen/service_item.dart';
import 'package:tevrozo_clone_four/screens/home_screen/user_balance.dart';
import 'package:tevrozo_clone_four/shared/assets.dart';
import 'package:tevrozo_clone_four/shared/size_config.dart';
import 'package:tevrozo_clone_four/shared/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller_1 = PageController();
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final sizeConfig = SizeConfig(context);
    final widthBlocks = sizeConfig.blockSizeHorizontal();
    final heightBlocks = sizeConfig.blockSizeVertical();

    final color = Theme.of(context).colorScheme;

    List<InsightsModel> insights = [
      InsightsModel(imagePath: ImagePaths.female_1, message: l10n.insightMessage1),
      InsightsModel(imagePath: ImagePaths.female_2, message: l10n.insightMessage2),
    ];

    List<ServiceModel> services = [
      ServiceModel(icon: Icons.fire_truck_outlined, lable: l10n.svTruck),
      ServiceModel(icon: Icons.airplanemode_active, lable: l10n.svAir),
      ServiceModel(icon: IconlyLight.activity, lable: l10n.svSea),
      ServiceModel(icon: Icons.help, lable: l10n.help),
    ];

    return Container(
      decoration: BoxDecoration(gradient: purplePinkGradient(context)),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sizeConfig.screenHorizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: widthBlocks * 75,
                    child: const SearchField(),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: badges.Badge(
                      badgeStyle: badges.BadgeStyle(
                        padding: const EdgeInsets.all(7),
                        borderSide: BorderSide(
                          color: color.onPrimary,
                          width: 2.0,
                        ),
                      ),
                      child: Icon(
                        IconlyLight.notification,
                        color: color.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: sizeConfig.screenHorizontalPadding),
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
                decoration: BoxDecoration(
                  color: color.surfaceVariant,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    const UserBalance(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: heightBlocks * 3.4),
                      child: SizedBox(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(services.length, (index) {
                            final service = services[index];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ServiceItem(service: service),
                                Text(service.lable),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightBlocks * 16.9,
                      child: PageView(
                        controller: controller_1,
                        children: List.generate(
                          2,
                          (index) => const PromotionCard(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: heightBlocks * 1.69),
                      child: Center(
                        child: SmoothPageIndicator(
                          controller: controller_1,
                          count: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: heightBlocks * 2.0,
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            l10n.insightsForYou,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextButton(onPressed: () {}, child: Text(l10n.viewMore))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: heightBlocks * 28.2,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final insight = insights[index];
                          return InsightCard(insight: insight);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 20);
                        },
                        itemCount: insights.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
