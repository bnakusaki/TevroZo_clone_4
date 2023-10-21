import 'package:flutter/material.dart';
import 'package:tevrozo_clone_four/screens/home_screen/serivce_model.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    super.key,
    required this.service,
  });

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {},
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 250, 250, 254),
              Color.fromARGB(255, 228, 223, 251),
            ],
          ),
        ),
        height: 70,
        width: 70,
        child: Icon(service.icon, color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
