
import 'package:flutter/material.dart';
import 'package:surge_seven/config/app_colors.dart';
import 'package:surge_seven/config/constants.dart';
import 'package:surge_seven/core/utils/screen_util.dart';

class MyFutureImage extends StatelessWidget {
  final String url;

  const MyFutureImage({
    super.key,
    required this.url,
  });



  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtil.instance;
    return FutureBuilder(
      future: precacheImage(
          NetworkImage(url), context),
      builder: (context, snapshot) {
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return Container(
            width: screenUtil.width - (2 * screenPaddingW),
            height: 200,
            color: AppColors.grey1,
            child: const Center(
              child: CircularProgressIndicator(
                  color: AppColors.primaryColorLight),
            ),
          );
        } else if (snapshot.error != null) {
          return const Icon(Icons.error);
        } else {
          return Image.network(url);
        }
      },
    );
  }
}