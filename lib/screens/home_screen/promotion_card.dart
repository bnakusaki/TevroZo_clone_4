import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tevrozo_clone_four/shared/assets.dart';

class PromotionCard extends StatelessWidget {
  const PromotionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final color = Theme.of(context).colorScheme;

    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.onPrimary,
            color.primary.withOpacity(0.01),
          ],
          stops: const [0.2, 0.9],
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
                l10n.packetDiscountCoupon,
                style: TextStyle(
                  color: color.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    l10n.upTo,
                    style: TextStyle(color: color.primary),
                  ),
                  Text(
                    l10n.percentageOff(15),
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
                      color.onPrimary,
                      color.primary.withOpacity(0.7),
                    ],
                    stops: const [0.01, 0.7],
                  ),
                ),
                child: Text(
                  l10n.promoCode,
                  style: TextStyle(color: color.onPrimary),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              ImagePaths.cube,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
