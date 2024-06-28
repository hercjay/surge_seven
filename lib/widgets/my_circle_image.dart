import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:surge_seven/config/app_colors.dart';

class MyCircleImage extends StatelessWidget {
  const MyCircleImage({
    super.key,
    required this.photo,
  });

  final String photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 150.0,
      width: 150.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: const Border(
          bottom: BorderSide(
            color: AppColors.grey1,
            width: 5.0,
          ),
          top: BorderSide(
            color: AppColors.grey1,
            width: 5.0,
          ),
        ),
        image: DecorationImage(
          image: FastCachedImageProvider(photo),
          //image: AssetImage(photo),
          fit: BoxFit.cover,
        ),
      ),);
  }
}