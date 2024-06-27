import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:surge_seven/config/app_colors.dart';
import 'package:surge_seven/config/constants.dart';
import 'package:surge_seven/core/data/truck/truck_model.dart';
import 'package:surge_seven/core/utils/screen_util.dart';
import 'package:surge_seven/widgets/my_future_image.dart';

class TruckDetailsScreen extends StatefulWidget {
  const TruckDetailsScreen({
    super.key,
    required this.truck,
  });

  final TruckModel truck;

  @override
  State<TruckDetailsScreen> createState() => _TruckDetailsScreenState();
}

class _TruckDetailsScreenState extends State<TruckDetailsScreen> {
  ValueNotifier<int> activeImgIndex = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtil.instance;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgrounColorLight,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.textColorDark.withOpacity(0.05),
          title: const Text('Truck Details'),
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: screenPadding2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder<int>(
                  valueListenable: activeImgIndex,
                  builder: (context, value, child) {
                    return MyFutureImage(url: widget.truck.photos[activeImgIndex.value]);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...widget.truck.photos.map((e) {
                      if (e.isNotEmpty && e != '') {
                        return GestureDetector(
                          onTap: () {
                            if (activeImgIndex.value !=
                                widget.truck.photos.indexOf(e)) {
                              activeImgIndex.value =
                                  widget.truck.photos.indexOf(e);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 10),
                            width:
                                screenUtil.width * 0.4 - (2 * screenPaddingW),
                            height: 120,
                            child: ClipRect(
                              clipBehavior: Clip.none,
                              child: FastCachedImage(
                                url: e,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

