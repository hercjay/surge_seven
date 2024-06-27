import 'package:flutter/material.dart';
import 'package:surge_seven/config/app_colors.dart';
import 'package:surge_seven/config/constants.dart';
import 'package:surge_seven/core/data/truck/truck_model.dart';
import 'package:surge_seven/core/utils/screen_util.dart';
import 'package:surge_seven/widgets/standard_screen.dart';

class TruckBookingScreen extends StatefulWidget {
  const TruckBookingScreen({super.key, this.truck});
  final TruckEntity? truck;

  @override
  State<TruckBookingScreen> createState() => _TruckBookingScreenState();
}

class _TruckBookingScreenState extends State<TruckBookingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtil.instance;
    return StandardScreen(
      title: Text('Place a booking'),
      child: Text('standard oo'),
    );
  }
}
