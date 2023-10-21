import 'package:flutter/material.dart';

class PromotionCard extends StatelessWidget {
  const PromotionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.01),
            Colors.white,
            Theme.of(context).colorScheme.primary.withOpacity(0.1),
          ],
          stops: const [0.05, 0.05, 0.75],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Packet Discount Coupon',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    'up\nto',
                    style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    '15% OFF',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white,
                      Theme.of(context).colorScheme.primary.withOpacity(0.7),
                    ],
                    stops: const [0.01, 0.7],
                  ),
                ),
                child: const Text(
                  'SV-DAY0001',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/images/cube.webp',
              height: 150,
              width: 130,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
