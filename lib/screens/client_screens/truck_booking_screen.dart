import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:surge_seven/config/app_colors.dart';
import 'package:surge_seven/config/constants.dart';
import 'package:surge_seven/config/get_it/dependency_injection.dart';
import 'package:surge_seven/features/truck/presentation/truck_provider.dart';
import 'package:surge_seven/features/truck/presentation/widgets/truck_card.dart';
import 'package:surge_seven/features/truck/truck.dart';
import 'package:surge_seven/core/data/types.dart';
import 'package:surge_seven/core/utils/screen_util.dart';
import 'package:surge_seven/widgets/components/green_card.dart';
import 'package:surge_seven/widgets/components/my_button.dart';
import 'package:surge_seven/widgets/components/my_secondary_button.dart';
import 'package:surge_seven/widgets/components/white_card.dart';
import 'package:surge_seven/widgets/my_circle_image.dart';
import 'package:surge_seven/widgets/my_dropdown.dart';
import 'package:surge_seven/widgets/my_textfield.dart';
import 'package:surge_seven/widgets/my_textfield2.dart';
import 'package:surge_seven/widgets/standard_screen.dart';

class TruckBookingScreen extends StatefulWidget {
  const TruckBookingScreen({super.key, this.truck});
  final Truck? truck;

  @override
  State<TruckBookingScreen> createState() => _TruckBookingScreenState();
}

class _TruckBookingScreenState extends State<TruckBookingScreen> {
  final _pickupLocController = TextEditingController();
  final _destinationLocController = TextEditingController();
  final _pickupDateController = TextEditingController();
  final _pickupTimeController = TextEditingController();
  final _dropOffTimeController = TextEditingController();
  final _dropOffDateController = TextEditingController();
  final _phoneController = TextEditingController();
  GlobalKey cargoWeightDropdownKey = GlobalKey();
  String selectedCargoWeight = '0 - 1000kg';
  Truck? selectedTruck;

  @override
  void initState() {
    super.initState();
    if (widget.truck != null) {
      selectedTruck = widget.truck!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtil.instance;
    return StandardScreen(
      title: const Text('Truck booking'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Place a Truck Order',
            style: titleTextStyle,
          ),
          const SizedBox(height: 30.0),

          ///pickup details
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                'Pickup Details',
                style: cardTitleStyle.copyWith(
                  color: AppColors.textColorLight,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          WhiteCard(
            child: Center(
              child: Column(
                children: [
                  MyTextField2(
                    controller: _pickupLocController,
                    maxLines: 3,
                    label: 'Pickup Location',
                    subLabel:
                        'Enter the full address of where the truck will pick up the items',
                    hintText: 'No 1, Babalola street, Ikeja, Lagos',
                  ),
                  const SizedBox(height: 10.0),
                  MyTextField2(
                    controller: _pickupDateController,
                    isReadonly: true,
                    isDatePicker: true,
                    label: 'Pickup Date',
                    subLabel:
                        'The day that the truck will pick up the items from the pickup location',
                    hintText: '10/May/2030',
                  ),
                  const SizedBox(height: 10.0),
                  MyTextField2(
                    controller: _pickupTimeController,
                    isReadonly: true,
                    isTimePicker: true,
                    label: 'Pickup Time',
                    subLabel:
                        'The time that the truck will pick up the items from the pickup location',
                    hintText: '10:00 AM',
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30.0),

          ///destination details
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                'Destination Details',
                style: cardTitleStyle.copyWith(
                  color: AppColors.textColorLight,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          WhiteCard(
            child: Center(
              child: Column(
                children: [
                  MyTextField2(
                    controller: _destinationLocController,
                    maxLines: 3,
                    label: 'Destination Location',
                    subLabel:
                        'Enter the full address of where the truck will deliver the items',
                    hintText: 'No 1, Babalola street, Ikeja, Lagos',
                  ),
                  const SizedBox(height: 10.0),
                  MyTextField2(
                    controller: _dropOffDateController,
                    isReadonly: true,
                    isDatePicker: true,
                    label: 'Dropoff Date',
                    subLabel:
                        'The day that the truck is expected to have delivered the items to the destination location',
                    hintText: '10/May/2090',
                  ),
                  const SizedBox(height: 10.0),
                  MyTextField2(
                    controller: _dropOffTimeController,
                    isReadonly: true,
                    isTimePicker: true,
                    label: 'Dropoff Time',
                    subLabel:
                        'The time that the truck is expected to have delivered the items to the destination location',
                    hintText: '10:00 AM',
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30.0),

          ///other details
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                'Other Details',
                style: cardTitleStyle.copyWith(
                  color: AppColors.textColorLight,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          WhiteCard(
            child: Center(
              child: Column(
                children: [
                  MyDropDown(
                    label: 'Cargo Weight',
                    dropdownKey: cargoWeightDropdownKey,
                    selectedItem: selectedCargoWeight,
                    hintText: 'Estimated Weight of your Items',
                    isListOfStrings: true,
                    items: cargoWeightTypes,
                    onChanged: (value) {
                      setState(() {
                        selectedCargoWeight = value;
                      });
                    },
                  ),
                  MyTextField2(
                    controller: _phoneController,
                    isNumberOnly: true,
                    label: 'Phone Number',
                    subLabel:
                        'Enter the phone number that the truck driver can reach you on',
                    hintText: '08012345678',
                  ),
                  const SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Truck to be booked:',
                      style: formLabelStyleBold.copyWith(
                        color: AppColors.textColorDark,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  selectedTruck == null
                      ? const Text('No truck selected yet')
                      : TruckCard(truck: selectedTruck!),
                  const SizedBox(height: 8),
                  selectedTruck == null
                      ? MySecondaryButton(
                          label: 'Choose a Truck',
                          paddingWidth: 60,
                          onPressed: () {
                            selectTruck(context);
                          })
                      : MySecondaryButton(
                          label: 'Change Truck',
                          paddingWidth: 60,
                          onPressed: () {
                            selectTruck(context);
                          }),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          MyButton(
            label: 'Place Truck Order',
            onPressed: bookTruck,
          ),
          const SizedBox(height: 100.0),
        ],
      ),
    );
  }

  selectTruck(BuildContext context) async {
    //show a list of trucks to select from in a dialog
    //when a truck is selected, set the selected truck to the widget.truck
    //and close the dialog
    late List<Truck> availabeTrucks;
    late List<Truck> allTrucks;
    final allTrucksEither = await getIt<TruckProvider>().getAllTrucks();
    allTrucksEither.fold(
      (error) {
        showError('Failed to get available trucks list. Try again later');
      },
      (trucks) {
        allTrucks = trucks;
        availabeTrucks = allTrucks.where((truck) => truck.isAvailable).toList();
        if (availabeTrucks.isEmpty) {
          showInfo('No available trucks at the moment. Try again later');
          return;
        }

        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Wrap(
              children: [
                Container(
                  color: AppColors.textColorDark.withOpacity(0.1),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text(
                      'Click on a truck to select it',
                      style: itemNameStyle2.copyWith(
                        color: AppColors.textColorDark,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: AppColors.textColorDark.withOpacity(0.1),
                  height: ScreenUtil.instance.height * 0.5,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: availabeTrucks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          padding: screenPadding,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: GestureDetector(
                              onTap: () {
                                dPrint(
                                    'tapped truck ${availabeTrucks[index].title}');
                                setState(() {
                                  selectedTruck = availabeTrucks[index];
                                });
                                Navigator.of(context).pop();
                              },
                              child: TruckCard(truck: availabeTrucks[index])));
                    },
                  ),
                ),
              ],
            );
          },
        );

        /////
      },
    );
  }

  bookTruck() {}
}
