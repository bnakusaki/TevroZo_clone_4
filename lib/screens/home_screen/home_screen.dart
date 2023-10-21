import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tevrozo_clone_four/screens/home_screen/promotion_card.dart';
import 'package:tevrozo_clone_four/screens/home_screen/search_field.dart';
import 'package:tevrozo_clone_four/screens/home_screen/serivce_model.dart';
import 'package:tevrozo_clone_four/screens/home_screen/service_item.dart';
import 'package:tevrozo_clone_four/screens/home_screen/user_balance.dart';
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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: purplePinkGradient(context)),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 330,
                    child: SearchField(),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Badge(
                      smallSize: 10,
                      child: Icon(
                        IconlyLight.notification,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
                height: MediaQuery.of(context).size.height - 241,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 253, 253, 253),
                  borderRadius: BorderRadius.only(
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
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final service = services[index];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [ServiceItem(service: service), Text(service.lable)],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: (MediaQuery.of(context).size.width - 290) / 4);
                          },
                          itemCount: services.length,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: PageView(
                        controller: controller_1,
                        children: const [
                          PromotionCard(),
                          PromotionCard(),
                        ],
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
                              .headlineSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'View more',
                              style: TextStyle(fontSize: 16),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            2,
                            (index) => ShaderMask(
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
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add_box)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.pregnant_woman_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.percent)),
          ],
        ),
      ),
    );
  }
}
