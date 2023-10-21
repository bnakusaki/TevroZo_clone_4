import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ServiceModel {
  ServiceModel({
    required this.icon,
    required this.lable,
  });

  final IconData icon;
  final String lable;
}

List<ServiceModel> services = [
  ServiceModel(icon: Icons.fire_truck_outlined, lable: 'SV-Truck'),
  ServiceModel(icon: Icons.airplanemode_active, lable: 'SV-Air'),
  ServiceModel(icon: IconlyLight.activity, lable: 'SV-Sea'),
  ServiceModel(icon: Icons.help, lable: 'Help'),
];
