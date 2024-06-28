import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:surge_seven/config/app_colors.dart';
import 'package:surge_seven/config/constants.dart';
import 'package:surge_seven/config/get_it/dependency_injection.dart';
import 'package:surge_seven/features/truck/truck.dart';
import 'package:surge_seven/features/user/presentation/user_provider.dart';
import 'package:surge_seven/features/truck/presentation/screens/truck_details_screen.dart';
import 'package:surge_seven/widgets/card_item.dart';
import 'package:surge_seven/widgets/components/my_button.dart';
import 'package:surge_seven/widgets/components/tag_item.dart';

class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({super.key});

  @override
  State<ClientHomeScreen> createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = getIt.get<UserProvider>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgrounColorLight,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.textColorDark.withOpacity(0.05),
          title: const Text('Surge Seven'),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/png/logo2.png',
              fit: BoxFit.contain,
              height: 40,
            ),
          ),
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: screenPadding2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome, ${userProvider.user.firstname}',
                  style: titleTextStyle,
                ),
                Text(
                  'What would you like to do today?',
                  style: smallTextStyle,
                ),
                const SizedBox(height: 30.0),
                AvailableTrucks(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AvailableTrucks extends StatelessWidget {
  const AvailableTrucks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available Trucks',
          style: cardTitleStyle,
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 320.0,
          // color: Colors.lightBlue,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: trucksDemoList.map((e) {
              return GestureDetector(
                onTap: () {
                  hercNavigationPush(context, TruckDetailsScreen(truck: e));
                },
                child: CardItem(
                  title: e.title,
                  photo: e.photos[0],
                  extra: MyButton(
                    label: 'Book This Truck',
                    onPressed: () {
                      hercNavigationPush(context, TruckDetailsScreen(truck: e));
                    },
                  ),
                  tagTL: TagItem(
                    text: e.targetWeight,
                    color: AppColors.redColor,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
