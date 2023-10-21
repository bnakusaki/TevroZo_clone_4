import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserBalance extends StatelessWidget {
  const UserBalance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: l10n.balanceCardtitle),
                      TextSpan(
                        text: l10n.balance(1250.12),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const SizedBox(height: 45, child: VerticalDivider()),
                TextButton(
                  onPressed: () {},
                  child: Column(
                    children: [
                      const Icon(Icons.wallet),
                      Text(l10n.topUp, style: const TextStyle(color: Colors.black38)),
                    ],
                  ),
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '🥇1200',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextSpan(text: l10n.svPoints(1200)),
                    ],
                  ),
                ),
                TextButton(onPressed: () {}, child: Text(l10n.details))
              ],
            )
          ],
        ),
      ),
    );
  }
}
