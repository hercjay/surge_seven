import 'package:flutter/material.dart';
import 'package:surge_seven/config/app_colors.dart';
import 'package:surge_seven/config/constants.dart';
import 'package:surge_seven/features/truck/truck.dart';
import 'package:surge_seven/widgets/components/white_card.dart';
import 'package:surge_seven/widgets/my_circle_image.dart';

class TruckCard extends StatelessWidget {
  const TruckCard({
    super.key,
    required this.truck,
  });

  final Truck truck;

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
        child: Column(
          children: [
            const Divider(),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Cost:  ',
              style: TextStyle(
                color: AppColors.textColorDark,
              ),
            ),
                Text(
                  truck.cost.toString(),
                  maxLines: 3,
                  style: cardTitleStyle.copyWith(
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.textColorDark,
                  ),
                ),
              ],
            ),
            MyCircleImage(photo: truck.photos[0]),
            const SizedBox(height: 10.0),
            Text(
              truck.title,
              style: itemNameStyle2.copyWith(
                color: AppColors.textColorDark,
              ),
            ),
            
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.local_shipping,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(truck.targetWeight),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(truck.ownerUsername),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const Divider(),
          ],
        ),
      );
  }
}