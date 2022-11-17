import 'package:flutter/material.dart';
import 'package:improvment/constants.dart';

class Task extends StatefulWidget {
  final Color backgroundColor;

  final Color foregroundColor;

  final String taskName;

  final String taskDuration;

  final bool? checked;

  const Task({Key? key,
        required this.backgroundColor,
        required this.foregroundColor,
        required this.taskName,
        required this.taskDuration,
        this.checked
  }) : super(key: key);

  static const Color backGroundColor = Color(0xffe8f0f9);
  static const Radius radius = Radius.circular(20);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  late bool checked;
  @override
  void initState() {
    super.initState();
    checked = widget.checked ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState((){
          checked = !checked;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: const BorderRadius.only(topRight: Task.radius,
                bottomLeft: Task.radius,
                bottomRight: Task.radius),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.taskName, style: TextStyle(color: widget.foregroundColor, fontWeight: FontWeight.w500, fontSize: 18),),
                      const SizedBox(height: 10,),
                      Text(widget.taskDuration, style: const TextStyle(color: kMainGrayTextColor, fontWeight: FontWeight.w700),),

                    ],
                  ),
                ),
                Expanded(flex: 1, child: Checkbox(value: checked , shape: const CircleBorder(), checkColor: widget.foregroundColor, activeColor: widget.backgroundColor, onChanged: (bool? value) {  },))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FitnessRoutineTask extends Task{
   const FitnessRoutineTask({super.key,
    required super.taskName,
    required super.taskDuration,
    super.checked

  }) :
        super(backgroundColor: kFitnessLightColor, foregroundColor: kFitnessDarkColor);

}

class MedicationRoutineTask extends Task{
   const MedicationRoutineTask({super.key,
    required super.taskName,
    required super.taskDuration,
    super.checked
  }) : super(backgroundColor: kMedicationLightColor, foregroundColor: kMedicationDarkColor);

}

class RecreationRoutineTask extends Task{
   const RecreationRoutineTask({super.key,
    required super.taskName,
    required super.taskDuration,
    super.checked
  }) : super( backgroundColor: kRecreationLightColor, foregroundColor: kRecreationDarkColor);

}

class SocializeRoutineTask extends Task{
   const SocializeRoutineTask({super.key,
    required super.taskName,
    required super.taskDuration,
    super.checked
  }) : super(backgroundColor: kSocializeLightColor, foregroundColor: kSocializeDarkColor);

}
