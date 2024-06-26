import 'package:flutter/material.dart';

class TruckOwnerHomeScreen extends StatefulWidget {
  const TruckOwnerHomeScreen({super.key});

  @override
  State<TruckOwnerHomeScreen> createState() => _TruckOwnerHomeScreenState();
}

class _TruckOwnerHomeScreenState extends State<TruckOwnerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text('Truck Owner HOME Screen'),
      ),
    );
  }
}
