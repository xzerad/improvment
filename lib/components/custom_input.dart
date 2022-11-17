import 'package:flutter/material.dart';

import '../constants.dart';

class CustomFormInput extends StatelessWidget {
  final String? hint;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const CustomFormInput({Key? key, this.hint, this.validator, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorColor: kMainGrayTextColor,
      style: const TextStyle(color: kProfileMainInfo, fontSize: 16),
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: kMainGrayTextColor),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: kMainGrayTextColor,
                  width: 3
              )
          )
      ),

    );
  }
}
