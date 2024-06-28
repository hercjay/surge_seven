import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:surge_seven/config/app_colors.dart';
import 'package:surge_seven/config/constants.dart';
import 'package:surge_seven/config/get_it/dependency_injection.dart';
import 'package:surge_seven/features/truck/truck.dart';
import 'package:surge_seven/features/truck/presentation/truck_provider.dart';
import 'package:surge_seven/core/utils/screen_util.dart';
import 'package:surge_seven/screens/client_screens/truck_booking_screen.dart';
import 'package:surge_seven/widgets/components/my_button.dart';
import 'package:surge_seven/widgets/components/tag_item.dart';
import 'package:surge_seven/widgets/components/white_card.dart';
import 'package:surge_seven/widgets/my_future_image.dart';
import 'package:surge_seven/widgets/standard_screen.dart';

class TruckDetailsScreen extends StatefulWidget {
  const TruckDetailsScreen({
    super.key,
    required this.truck,
  });

  final Truck truck;

  @override
  State<TruckDetailsScreen> createState() => _TruckDetailsScreenState();
}

class _TruckDetailsScreenState extends State<TruckDetailsScreen> {
  ValueNotifier<int> activeImgIndex = ValueNotifier<int>(0);
  final truckProvider = getIt<TruckProvider>();
  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtil.instance;
    return StandardScreen(
      title: const Text('Truck Details'),
      topWidget: Column(
        children: [
          ValueListenableBuilder<int>(
            valueListenable: activeImgIndex,
            builder: (context, value, child) {
              return SizedBox(
                child: MyFutureImage(
                    url: widget.truck.photos[activeImgIndex.value]),
              );
            },
          ),
          Transform.translate(
            offset: const Offset(0, -40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...widget.truck.photos.map((e) {
                  if (e.isNotEmpty && e != '') {
                    return GestureDetector(
                      onTap: () {
                        if (activeImgIndex.value !=
                            widget.truck.photos.indexOf(e)) {
                          activeImgIndex.value = widget.truck.photos.indexOf(e);
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 10),
                        width: screenUtil.width * 0.33 - (2 * screenPaddingW),
                        height: 80,
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
            ),
          ),
        ],
      ),
      child: Transform.translate(
        offset: const Offset(0, -30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WhiteCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      widget.truck.title,
                      maxLines: 4,
                      style: cardTitleStyle.copyWith(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.truck.description,
                    style: mediumTextStyle,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.local_shipping,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(widget.truck.targetWeight),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(widget.truck.ownerUsername),
                          // FutureBuilder(
                          //   future: truckProvider
                          //       .getTruckOwner(widget.truck.ownerUsername),
                          //   builder: (context, snapshot) {
                          //     if (snapshot.connectionState ==
                          //         ConnectionState.waiting) {
                          //       return const Text('...');
                          //     }
                          //     if (snapshot.hasError) {
                          //       return const Text('?');
                          //     }
                          //     return snapshot.data!.fold(
                          //       (error) => const Text('?'),
                          //       (truckOwner) => Text(
                          //           '${truckOwner.firstname} ${truckOwner.lastname}'),
                          //     );
                          //   },
                          // ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            MyButton(
              label: 'Book This Truck',
              onPressed: () {
                hercNavigationPush(
                    context, TruckBookingScreen(truck: widget.truck));
              },
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
