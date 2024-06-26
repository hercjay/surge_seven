import 'package:flutter/material.dart';
import 'package:surge_seven/config/constants.dart';

class MyDropDown extends StatelessWidget {
  final Key dropdownKey;
  final dynamic selectedItem;
  final String hintText;
  final String? label;
  final List<Map<String, dynamic>> items;
  final Function(dynamic val) onChanged;

  const MyDropDown({
    super.key,
    required this.dropdownKey,
    required this.selectedItem,
    this.label,
    required this.hintText,
    required this.items,
    required this.onChanged,
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
                        style: formLabelStyle,
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],
                )
              : const SizedBox(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: screenPaddingW),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //color: setTextFieldFilledColor(context),
            ),
            child: DropdownButton(
              key: dropdownKey,
              isExpanded: true,
              value: (selectedItem != 0 && selectedItem != "0") ? selectedItem : null,
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
              items: items
                  .map((item) => DropdownMenuItem<dynamic>(
                        value: item['id'],
                        child: Text(
                          item['name'],
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
