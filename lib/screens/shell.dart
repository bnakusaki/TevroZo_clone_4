import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class Shell extends StatelessWidget {
  const Shell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomAppBar(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomAppBarItemBuilder(
              appBarItem: BottomAppBarItem(
                lable: l10n.home,
                icon: Icons.home,
                onPressed: () => context.go('/home'),
              ),
            ),
            BottomAppBarItemBuilder(
              appBarItem: BottomAppBarItem(
                lable: l10n.packet,
                icon: Icons.delivery_dining_sharp,
              ),
            ),
            FloatingActionButton(
              onPressed: () => context.go('/'),
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(Icons.add, color: Colors.white),
            ),
            BottomAppBarItemBuilder(
              appBarItem: BottomAppBarItem(
                lable: l10n.promo,
                icon: IconlyLight.activity,
              ),
            ),
            BottomAppBarItemBuilder(
              appBarItem: BottomAppBarItem(
                lable: l10n.profile,
                icon: Icons.person_2_outlined,
                onPressed: () => context.go('/profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomAppBarItemBuilder extends StatelessWidget {
  const BottomAppBarItemBuilder({
    super.key,
    required this.appBarItem,
  });

  final BottomAppBarItem appBarItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: appBarItem.onPressed,
          icon: Icon(appBarItem.icon),
        ),
        Text(
          appBarItem.lable,
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }
}

class BottomAppBarItem {
  BottomAppBarItem({
    required this.icon,
    required this.lable,
    this.onPressed,
  });

  final IconData icon;
  final String lable;
  final Function()? onPressed;
}
