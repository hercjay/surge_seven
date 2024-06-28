import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:surge_seven/config/app_colors.dart';
import 'package:surge_seven/config/constants.dart';
import 'package:surge_seven/widgets/my_circle_image.dart';

class CardItem extends StatelessWidget {
  final String title;
  final String photo;

  final Widget extra;
  final Widget tagTL;

  const CardItem({
    super.key,
    this.title = '',
    this.photo = '',
    this.extra = const Text(''),
    this.tagTL = const Text(''),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          width: 250.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  MyCircleImage(photo: photo),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: itemNameStyle,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
                child: extra,
              ),
            ],
          ),
        ),
        Positioned(
          top: 15,
          left: 10,
          child: tagTL,
        ),
      ],
    );
  }
}


