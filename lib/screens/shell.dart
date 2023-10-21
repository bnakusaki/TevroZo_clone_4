import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Shell extends StatelessWidget {
  const Shell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () => context.go('/home'), icon: const Icon(Icons.home)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add_box)),
            FloatingActionButton(
              onPressed: () => context.go('/'),
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(Icons.add, color: Colors.white),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.pregnant_woman_outlined)),
            IconButton(onPressed: () => context.go('/profile'), icon: const Icon(Icons.percent)),
          ],
        ),
      ),
    );
  }
}
