import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:improvment/components/custom_icon.dart';
import 'package:improvment/constants.dart';

class TaskScreen extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color iconBackgroundColor;
  final Color foregroundColor;
  final String asset;

  const TaskScreen({Key? key, required this.title,
    required this.backgroundColor,
    required this.iconBackgroundColor,
    required this.foregroundColor,
    required this.asset
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: TasksBody(
        title: title,
        backgroundColor: backgroundColor,
        iconBackgroundColor: iconBackgroundColor,
        foregroundColor: foregroundColor,
        asset: asset,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){}, backgroundColor: backgroundColor,
        child: const Icon(Icons.add, color: Colors.white,),),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

class TasksBody extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color iconBackgroundColor;
  final String asset;

  const TasksBody({
    Key? key, required this.title,
    required this.backgroundColor,
    required this.iconBackgroundColor,
    required this.foregroundColor,
    required this.asset
  }) : super(key: key);
  static const Radius radius = Radius.circular(30);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: size.height,
          width: size.width,
          child: ColoredBox(
            color: backgroundColor,
            child: AppBar(
              leading: CustomIcon(
                onPress: (){
                  Navigator.of(context).pop();
                },
                iconData: Icons.keyboard_arrow_left,
                backgroundColor: iconBackgroundColor,
                foregroundColor: Colors.white,),
              title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 19),),
              centerTitle: true,
/*              actions: [
                CustomIcon(iconData: Icons.more_vert_outlined,
                    backgroundColor: iconBackgroundColor,
                    foregroundColor: Colors.white)
              ],*/
              elevation: 0,
              backgroundColor: backgroundColor,
            ),),
        ),
        Positioned(
          top: 100,
          child: Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: radius, topRight: radius)
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 10,
            child: SvgPicture.asset(asset, color: foregroundColor, height: 100, width: 100,)
        ),
        Positioned(
          top: 100,
          left: 5,
          right: 5,
          child: SizedBox(
            height: size.height - 100,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text.rich(TextSpan(
                        children: [
                          TextSpan(text: "Tasks "),
                          TextSpan(text: "(3)")
                        ], style: TextStyle(color: kMainGrayTextColor, fontWeight: FontWeight.w500, fontSize: 21)
                    )),
                    const SizedBox(height: 30,),
                    TaskInfoCard(backgroundColor: backgroundColor, foregroundColor: foregroundColor, taskTitle: 'Test Task',),
                    TaskInfoCard(backgroundColor: backgroundColor, foregroundColor: foregroundColor, taskTitle: 'Test Task',),
                    TaskInfoCard(backgroundColor: backgroundColor, foregroundColor: foregroundColor, taskTitle: 'Test Task',),
                    TaskInfoCard(backgroundColor: backgroundColor, foregroundColor: foregroundColor, taskTitle: 'Test Task',),

                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class FitnessTaskScreen extends TaskScreen{
  const FitnessTaskScreen({super.key}):
        super( title: "Fitness",
          iconBackgroundColor: kTasksFitnessIconColor,
          backgroundColor: kFitnessDarkColor,
          foregroundColor: kFitnessLightColor,
          asset: 'assets/icons/arm-muscles-icon.svg'
      );

}

class MedicationTaskScreen extends TaskScreen{
  const MedicationTaskScreen({super.key}):
        super( title: "Medication",
          iconBackgroundColor: kTasksMedicationIconColor,
          backgroundColor: kMedicationDarkColor,
          foregroundColor: kMedicationLightColor,
          asset: 'assets/icons/pharmacy-pills-icon.svg'
      );

}

class RecreationTaskScreen extends TaskScreen{
  const RecreationTaskScreen({super.key}):
        super( title: "Recreation",
          iconBackgroundColor: kTasksRecreationIconColor,
          backgroundColor: kRecreationDarkColor,
          foregroundColor: kRecreationLightColor,
          asset: 'assets/icons/playing-cards-icon.svg'
        );

}

class SocializeTaskScreen extends TaskScreen{
  const SocializeTaskScreen({super.key}):
        super( title: "Socialize",
          iconBackgroundColor: kTasksSocializeIconColor,
          backgroundColor: kSocializeDarkColor,
          foregroundColor: kSocializeLightColor,
          asset: 'assets/icons/comments-icon.svg'
      );

}

class TaskInfoCard extends StatelessWidget {
  static const Radius radius = Radius.circular(30);
  final Color backgroundColor;
  final Color foregroundColor;
  final String taskTitle;

  const TaskInfoCard({Key? key,
    required this.backgroundColor,
    required this.taskTitle,
    required this.foregroundColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 120,
      decoration: BoxDecoration(
        color: foregroundColor,
        borderRadius: const BorderRadius.all(radius)
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(taskTitle, style: TextStyle(color: backgroundColor, fontWeight: FontWeight.w600, fontSize: 19),),
                    Icon(Icons.mode_edit_outline_outlined, color: backgroundColor,)
                  ],
                ),
                 Text.rich( TextSpan(children:[
                  WidgetSpan(child: Icon(Icons.access_time_outlined, color: backgroundColor.withOpacity(0.4), size: 18,)),
                  const TextSpan(text: " Everyday . 7:00am\n\n"),
                  WidgetSpan(child: Icon(Icons.notifications_none_outlined, color: backgroundColor.withOpacity(0.4), size: 18,)),
                  const TextSpan(text:" 15 min before" )
                ], style: const TextStyle(color: kMainGrayTextColor, fontWeight: FontWeight.w500))),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
              right: 0,
              child: Container(
                width: 120,
                height: 40,
                decoration:  BoxDecoration(
                  color: backgroundColor,
                  borderRadius: const BorderRadius.only(topLeft: radius, bottomRight: radius)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Icon(Icons.turn_slight_right, color: Colors.white,),
                    SvgPicture.asset("assets/icons/personal-development-icon.svg", width: 25, height: 25, color: Colors.white,),
                    const Text("Progress", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}

