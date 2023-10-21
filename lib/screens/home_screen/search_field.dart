import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconly/iconly.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onPrimary;
    final l10n = AppLocalizations.of(context)!;

    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          IconlyLight.search,
          color: color.withOpacity(0.6),
        ),
        suffixIcon: Icon(
          IconlyLight.scan,
          color: color.withOpacity(0.6),
        ),
        hintText: l10n.trackYouPackage,
        hintStyle: TextStyle(
          color: color.withOpacity(0.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        fillColor: color.withOpacity(0.1),
      ),
    );
  }
}
