import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surge_seven/config/app_colors.dart';
import 'package:surge_seven/config/constants.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.label = '',
    this.maxLength = 25,
    this.isPassword = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String label;
  final int maxLength;
  final int maxLines;
  final bool isPassword;

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
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
              style: formLabelStyle.copyWith(
                color: AppColors.textColorLight,
              ),
            ),
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: widget.controller,
            maxLines: widget.maxLines,
            obscureText: widget.isPassword ? isObscure : false,
            style: const TextStyle(color: Colors.white),
            textCapitalization: TextCapitalization.sentences,
            autovalidateMode: AutovalidateMode.always,
            inputFormatters: [
              LengthLimitingTextInputFormatter(widget.maxLength),
            ],
            decoration: InputDecoration(
              filled: false,
              hintStyle: const TextStyle(color: AppColors.textColorLight2),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.white),
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
