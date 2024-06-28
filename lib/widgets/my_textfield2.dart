import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surge_seven/config/app_colors.dart';
import 'package:surge_seven/config/constants.dart';
import 'package:surge_seven/core/utils/date_util.dart';

class MyTextField2 extends StatefulWidget {
  const MyTextField2({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.label = '',
    this.subLabel = '',
    this.maxLength = 25,
    this.isPassword = false,
    this.isReadonly = false,
    this.isDatePicker = false,
    this.isTimePicker = false,
    this.isNumberOnly = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String label;
  final String subLabel;
  final int maxLength;
  final int maxLines;
  final bool isPassword;
  final bool isReadonly;
  final bool isDatePicker;
  final bool isTimePicker;
  final bool isNumberOnly;

  @override
  _MyTextField2State createState() => _MyTextField2State();
}

class _MyTextField2State extends State<MyTextField2> {
  bool isObscure = false;

  @override
  void initState() {
    isObscure = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10), //horizontal 18
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.label,
              style: formLabelStyleBold.copyWith(
                color: AppColors.textColorDark,
              ),
            ),
          ),
          if (widget.subLabel.isNotEmpty)
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.subLabel,
                style: smallTextStyle,
              ),
            ),
          const SizedBox(height: 6),
          TextFormField(
            onTap: () {
              if (widget.isDatePicker) {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                ).then((selectedDate) {
                  if (selectedDate != null) {
                    widget.controller.text = DateUtil.formatDate(
                        selectedDate.toString().split(' ')[0]);
                    dPrint(
                        'selected date is ${selectedDate.toString()} and formatted date is ${widget.controller.text}');
                  }
                });
              } else if (widget.isTimePicker) {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then((selectedTime) {
                  if (selectedTime != null) {
                    widget.controller.text = selectedTime.format(context);
                    dPrint(
                        'selected time is ${selectedTime.toString()} and formatted time is ${widget.controller.text}');
                  }
                });
              }
            },
            keyboardType: widget.isNumberOnly ? TextInputType.phone : TextInputType.text,
            readOnly: widget.isReadonly,
            controller: widget.controller,
            maxLines: widget.maxLines,
            obscureText: widget.isPassword ? isObscure : false,
            style: const TextStyle(color: AppColors.textColorDark),
            textCapitalization: TextCapitalization.sentences,
            autovalidateMode: AutovalidateMode.always,
            inputFormatters: [
              LengthLimitingTextInputFormatter(widget.maxLength),
            ],
            decoration: InputDecoration(
              filled: false,
              fillColor: AppColors.textWidgetFilledColor2,
              hintStyle: const TextStyle(color: AppColors.textColorLight2),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: AppColors.textColorDark2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: AppColors.textColorDark2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: AppColors.textColorDark2),
              ),
              hintText: widget.hintText,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            isObscure = !isObscure;
                          },
                        );
                      },
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
