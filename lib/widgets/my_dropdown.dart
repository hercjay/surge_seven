import 'package:flutter/material.dart';
import 'package:surge_seven/config/app_colors.dart';
import 'package:surge_seven/config/constants.dart';

class MyDropDown extends StatelessWidget {
  final Key dropdownKey;
  final dynamic selectedItem;
  final String hintText;
  final String? label;
  final bool isListOfStrings;
  final dynamic items;
  final Function(dynamic val) onChanged;

  const MyDropDown({
    super.key,
    required this.dropdownKey,
    required this.selectedItem,
    this.label,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.isListOfStrings = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          label != null
              ? Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        label!,
                        style: formLabelStyleBold.copyWith(
                          color: AppColors.textColorDark,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],
                )
              : const SizedBox(),
          Container(
            padding:
                EdgeInsets.symmetric(vertical: 1, horizontal: screenPaddingW),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.textColorDark,
                width: 1,
              ),
              //color: setTextFieldFilledColor(context),
            ),
            child: DropdownButton(
              key: dropdownKey,
              isExpanded: true,
              value: (selectedItem != 0 && selectedItem != "0")
                  ? selectedItem
                  : null,
              icon: const Icon(Icons.arrow_downward),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
              underline: Container(
                height: 0,
                color: Colors.transparent,
              ),
              iconSize: 24,
              //dropdownColor: setTextFieldFilledColor(context),
              hint: Text(hintText),
              items: isListOfStrings
                  ? items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.normal),
                        ),
                      );
                    }).toList()
                  : items
                      .map((item) => DropdownMenuItem<dynamic>(
                            value: item['id'],
                            child: Text(
                              item['name'] ?? item['title'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.normal),
                            ),
                          ))
                      .toList(),
              onChanged: (value) {
                onChanged(value!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
