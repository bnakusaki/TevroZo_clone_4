import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          appBar: AppBar(
            toolbarHeight: 80,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: TextFormField(),
            actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.notification_add))],
          ),
          body: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Color.fromARGB(255, 207, 202, 202),
            ),
            child: ListView(
              children: [
                Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: 'Your balance\n'),
                                TextSpan(text: '\$1,250.12')
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Top-up'),
                          ),
                        ],
                      ),
                      const Divider(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '🪙 1200 ',
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextSpan(
                                  text: 'SV-Points',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                          TextButton(onPressed: () {}, child: const Text('Details'))
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50, child: ListView(scrollDirection: Axis.horizontal)),
                SizedBox(height: 100, child: PageView()),
                const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: []),
                SizedBox(height: 50, child: ListView(scrollDirection: Axis.horizontal))
              ],
            ),
          ),
          bottomNavigationBar: const BottomAppBar(),
        ),
      ),
    );
  }
}
