import 'package:flutter/material.dart';

class UserBalance extends StatelessWidget {
  const UserBalance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                      const TextSpan(text: 'Your balance\n'),
                      TextSpan(
                        text: '\$1250.12',
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
                  child: const Column(
                    children: [
                      Icon(Icons.wallet),
                      Text('Top-up', style: TextStyle(color: Colors.black38)),
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
                      const TextSpan(text: ' SV-Points'),
                    ],
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('Details'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
