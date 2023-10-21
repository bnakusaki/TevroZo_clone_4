import 'package:flutter/material.dart';
import 'package:tevrozo_clone_four/screens/home_screen/serivce_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MembershipCard(),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final section = profileSections[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      section.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    ...List.generate(
                      section.options.length,
                      (index) {
                        final option = section.options[index];
                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                child: Icon(option.icon),
                              ),
                              title: Text(option.title),
                              subtitle: Text(option.description),
                              trailing: const Icon(Icons.chevron_right),
                            ),
                            const Divider()
                          ],
                        );
                      },
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  height: 15,
                );
              },
              itemCount: profileSections.length,
            ),
          ),
        ],
      ),
    );
  }
}

List<ProfileSection> profileSections = [
  ProfileSection(
    title: 'Account Details',
    options: [
      Option(
        title: 'Detail Profile',
        description: 'Information account',
        icon: Icons.person,
      ),
      Option(
        title: 'Transaction History',
        description: 'Your transactioon history',
        icon: Icons.note,
      ),
      Option(
        title: 'Payment Account',
        description: 'Manage your payment',
        icon: Icons.wallet,
      ),
    ],
  ),
  ProfileSection(
    title: 'Settings',
    options: [
      Option(
        title: 'Notification',
        description: 'Your notification settings',
        icon: Icons.notifications,
      ),
      Option(
        title: 'Transaction History',
        description: 'Your transactioon history',
        icon: Icons.note,
      ),
      Option(
        title: 'Payment Account',
        description: 'Manage your payment',
        icon: Icons.wallet,
      ),
    ],
  ),
];

class ProfileSection {
  ProfileSection({
    required this.title,
    required this.options,
  });
  final String title;
  final List<Option> options;
}

class Option {
  Option({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}

class MembershipCard extends StatelessWidget {
  const MembershipCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            Colors.pink.withOpacity(0.7),
            Theme.of(context).colorScheme.primary,
          ],
          stops: const [0.6, 0.90, 1.0],
        ),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Row(
            children: [
              Badge(
                alignment: Alignment.topLeft,
                smallSize: 20,
                child: CircleAvatar(
                  radius: 30,
                ),
              ),
              SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mihceal W.'),
                  Text('Premium Member | NGOT986'),
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
                      Text(service.lable),
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

List<ServiceModel> personalStats = [
  ServiceModel(icon: Icons.fire_truck_outlined, lable: 'My Points'),
  ServiceModel(icon: Icons.airplanemode_active, lable: 'My Voucher'),
  ServiceModel(icon: Icons.help, lable: 'My Mission'),
];
