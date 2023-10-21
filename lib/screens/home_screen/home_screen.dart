import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tevrozo_clone_four/screens/home_screen/promotion_card.dart';
import 'package:tevrozo_clone_four/screens/home_screen/search_field.dart';
import 'package:tevrozo_clone_four/screens/home_screen/serivce_model.dart';
import 'package:tevrozo_clone_four/screens/home_screen/service_item.dart';
import 'package:tevrozo_clone_four/screens/home_screen/user_balance.dart';
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
    final sizeConfig = SizeConfig(context);
    final widthBlocks = sizeConfig.blockSizeHorizontal();
    final heightBlocks = sizeConfig.blockSizeVertical();
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
                          color: Theme.of(context).colorScheme.onPrimary,
                          width: 2.0,
                        ),
                      ),
                      child: Icon(
                        IconlyLight.notification,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    const UserBalance(),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                      child: SizedBox(
                        height: 108,
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
                      height: 150,
                      child: PageView(
                        controller: controller_1,
                        children: List.generate(
                          2,
                          (index) => const PromotionCard(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Center(
                        child: SmoothPageIndicator(
                          controller: controller_1,
                          count: 2,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Insights for you',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextButton(onPressed: () {}, child: const Text('View more'))
                      ],
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ShaderMask(
                          shaderCallback: (bounds) {
                            return LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Theme.of(context).colorScheme.primary,
                                Colors.white,
                                Theme.of(context).colorScheme.primary,
                              ],
                              stops: const [0.0, 0.25, 0.75],
                            ).createShader(bounds);
                          },
                          child: Container(
                            height: 250,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/avatar_1.jpg'),
                              ),
                            ),
                          ),
                        ),
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 20);
                        },
                        itemCount: 2,
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
