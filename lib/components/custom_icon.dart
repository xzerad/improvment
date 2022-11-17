import 'package:flutter/material.dart';
import '../constants.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.iconData, this.onPress,
    required this.backgroundColor,required this.foregroundColor}) : super(key: key);
  final IconData iconData;
  final Function()? onPress;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPress,
        child: CircleAvatar(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          child: Icon(iconData, size: 20,),
        ),
      ),
    );
  }
}



class ProfileIcon extends StatelessWidget {
  final IconData iconData;
  final Function()? onPress;
  const ProfileIcon({Key? key, required this.iconData, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomIcon(
        onPress: onPress,
        iconData: iconData,
        backgroundColor: kProfileIconsBackgroundColor,
        foregroundColor: kProfileIconForegroundColor);
  }
}
