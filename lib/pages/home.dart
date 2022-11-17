import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:improvment/components/custom_drawer.dart';
import 'package:improvment/components/today_task_component.dart';
import 'package:improvment/models/drawer_cubit.dart';

import '../constants.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody()
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> slideAnimation;
  late Animation<double> scaleAnimation;
  @override
  initState(){
    super.initState();
    _controller = AnimationController(vsync: this,
        duration: const Duration(milliseconds: 600));
    slideAnimation = Tween<double>(
      begin: 0,
      end: 250,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    scaleAnimation = Tween<double>(
      begin: 0,
      end: 25
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    context.read<DrawerCubit>().closeDrawer();
    
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          const CustomDrawer(),
          BlocBuilder<DrawerCubit, DrawerState>(
            builder: (context, state) {
              return Positioned(
                  left: state.drawerOpeningSize,
                  child: Container(
                    height: size.height,
                    width: size.width,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Container(

                        width: size.width,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              height: 250,
                              width: size.width,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                    colors: [
                                      kMainLightBlueColor,
                                      kMainDarkBlueColor
                                ]),
                                borderRadius: BorderRadius.only(

                                    bottomRight: Radius.circular(50))
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Container(
                                             height: 50,
                                             width: 50,
                                             decoration: const BoxDecoration(
                                               color: Color(0x7955487E),
                                               borderRadius: BorderRadius.only(bottomRight: Radius.circular(25))

                                             ),
                                             child: IconButton(onPressed: (){
                                               DrawerState state = context.read<DrawerCubit>().state;
                                               switch (state.runtimeType){
                                                 case DrawerOpened:
                                                   _controller.reverse();
                                                   slideAnimation.addListener(() {
                                                     if(slideAnimation.isDismissed){
                                                       context.read<DrawerCubit>().closeDrawer();
                                                     }else{
                                                       context.read<DrawerCubit>().openDrawerBy(slideAnimation.value);
                                                     }
                                                   });
                                                   break;

                                                 case DrawerClosed:
                                                   _controller.forward(from: 0);
                                                   slideAnimation.addListener(() {
                                                     if(slideAnimation.isCompleted){
                                                       context.read<DrawerCubit>().openDrawer();
                                                     }else{
                                                       context.read<DrawerCubit>().openDrawerBy(slideAnimation.value);
                                                     }
                                                   });
                                                   break;


                                               }

                                             }, icon: BlocBuilder<DrawerCubit, DrawerState>(
                                              builder: (context, state) {

                                                return Stack(
                                                 children: [
                                                   Icon(Icons.keyboard_arrow_left, size: scaleAnimation.value, color: Colors.white,),
                                                   Icon(Icons.menu, size: 25 - scaleAnimation.value, color: Colors.white),
                                                 ]
                                             );
  },
)
                                             ),
                                           ),
                                           Container(
                                             height: 30,
                                             decoration: BoxDecoration(
                                               color: const Color(0x558F7BCE),
                                               borderRadius: BorderRadius.circular(15)
                                             ),
                                             child: Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Row(
                                                 children: [
                                                   const Text('100 ', style: TextStyle(color: Colors.white),),
                                                   Image.asset("assets/images/coin.png", width: 22, height: 22,)
                                                 ],
                                               ),
                                             ),
                                           )
                                         ],
                                       ),
                                  Padding(
                                        padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          mainAxisSize: MainAxisSize.max,
                                          children:  [
                                            const Text("Hello Radwan", style: TextStyle(fontSize: 28, color: Colors.white),),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text("It's time for: push ups", style: TextStyle(fontSize: 18, color: Colors.white)),
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: Colors.white, elevation: 4, foregroundColor: kMainLightBlueColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))), child: const Text("Check Now"),),
                                                TextButton(onPressed: (){}, style: TextButton.styleFrom(foregroundColor: Colors.white, backgroundColor: kMainLightBlueColor.withOpacity(.3), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))), child: const Text("Remind me Later"))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),


                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("Today's Tasks", style: TextStyle(color: kMainGrayTextColor, fontWeight: FontWeight.w600, fontSize: 22),),
                                    Text("1/6 completed", style: TextStyle(color: kMainGrayTextColor, fontWeight: FontWeight.w700),)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 18.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  [
                                      Expanded(
                                        flex: 1,
                                      child: CustomPaint(
                                        painter: CustomTimeline(taskList: [TaskType.fitness, TaskType.medication, TaskType.recreation, TaskType.socialize, TaskType.socialize, ]),
                                      ),
                                      ),
                                       Expanded(
                                         flex: 5,
                                         child:
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: const [
                                              FitnessRoutineTask(taskName: "Morning Walk", taskDuration: "7:00 am - 7:30 am", checked: true,),
                                              MedicationRoutineTask(taskName: "Check Blood Sugar Level", taskDuration: "8:00 am - 8:30 am"),
                                              RecreationRoutineTask(taskName: "Code More", taskDuration: "9:00 am - 10:00 am"),
                                              SocializeRoutineTask(taskName: "Call Mom", taskDuration: "9:00 am - 10:00 am"),

                                            ],
                                          ),

                                      ),
                                    ],
                                  ),
                                ),

                              ],),
                            )

                          ],
                        ),
                      ),
                    ),
                  ),
                );
            }
          )

        ],
      ),
    );
  }
}
enum TaskType{
  fitness,
  medication,
  recreation,
  socialize
}

class CustomTimeline extends CustomPainter{
  List<TaskType> taskList;
  CustomTimeline({required this.taskList});
  static const double taskHeight = 95;
  @override
  void paint(Canvas canvas, Size size) {
    double height = 0;
    double widthCenter = size.width/2;
    for(var i = 0; i<taskList.length; i++){
      TaskType task = taskList[i];
      late Color color;
      switch (task){

        case TaskType.fitness:
          color = kFitnessDarkColor;
          break;
        case TaskType.medication:
          color = kMedicationDarkColor;
          break;
        case TaskType.recreation:
          color = kRecreationDarkColor;
          break;
        case TaskType.socialize:
          color = kSocializeDarkColor;
          break;
      }

      canvas.drawCircle(Offset(widthCenter, height), 6, Paint()..strokeWidth = 6 ..color = color..style = PaintingStyle.fill);
      if(i < taskList.length - 2){

        canvas.drawLine(Offset(widthCenter, height), Offset(widthCenter, height+taskHeight), Paint()..strokeWidth = 2 ..color = kMainGrayTextColor.withOpacity(0.2));
        height += taskHeight;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}