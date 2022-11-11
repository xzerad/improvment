import 'package:flutter/material.dart';
import 'package:improvment/constants.dart';

class Task extends StatelessWidget {
  final Color backgroundColor;

  final Color foregroundColor;

  final String taskName;

  final String taskDuration;

  const Task({Key? key,
        required this.backgroundColor,
        required this.foregroundColor,
        required this.taskName,
        required this.taskDuration}) : super(key: key);
  static const Color backGroundColor = Color(0xffe8f0f9);
  static const Radius radius = Radius.circular(20);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(topRight: radius,
            bottomLeft: radius,
            bottomRight: radius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(taskName, style: TextStyle(color: foregroundColor, fontWeight: FontWeight.w500, fontSize: 18),),
            const SizedBox(height: 10,),
            Text(taskDuration, style: const TextStyle(color: kMainGrayTextColor, fontWeight: FontWeight.w700),)
          ],
        ),
      ),
    );
  }
}

class FitnessRoutineTask extends Task{
  const FitnessRoutineTask({super.key,
    required super.taskName,
    required super.taskDuration}) :
        super(backgroundColor: kFitnessLightColor, foregroundColor: kFitnessDarkColor);

}

class MedicationRoutineTask extends Task{
  const MedicationRoutineTask({super.key,
    required super.taskName,
    required super.taskDuration
  }) : super(backgroundColor: kMedicationLightColor, foregroundColor: kMedicationDarkColor);

}

class RecreationRoutineTask extends Task{
  const RecreationRoutineTask({super.key,
    required super.taskName,
    required super.taskDuration
  }) : super( backgroundColor: kRecreationLightColor, foregroundColor: kRecreationDarkColor);

}

class SocializeRoutineTask extends Task{
  const SocializeRoutineTask({super.key,
    required super.taskName,
    required super.taskDuration
  }) : super(backgroundColor: kSocializeLightColor, foregroundColor: kSocializeDarkColor);

}
