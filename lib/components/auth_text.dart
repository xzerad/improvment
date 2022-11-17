import 'package:flutter/material.dart';
import '../constants.dart';

class AuthHeader extends StatelessWidget {
  final String header;
  const AuthHeader({Key? key, required this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      header, style: const TextStyle( fontSize: 30, color: kMainDarkBlueColor, fontFamily: "HennyPenny", height: 2),
    );
  }
}
