import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:improvment/components/profile_picture.dart';
import 'package:improvment/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/custom_icon.dart';
import '../models/user_data_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: ProfileBody(),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
              child: ProfileAppBar(),
            ),
          const SliverPadding(padding: EdgeInsets.all(15),
            sliver: SliverToBoxAdapter(
              child: MotivationCard(),
            ),
          ),
          const SliverPadding(
            padding:  EdgeInsets.all(15),
            sliver:  SliverToBoxAdapter(
              child: Text("My Tasks", style: TextStyle(color: kProfileMainInfo, fontSize: 18, fontWeight: FontWeight.w500),),
            )
          ),
          SliverPadding(
            padding: const EdgeInsets.all(15),
            sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: const [
                  TaskCard(backgroundColor: kMedicationLightColor, foregroundColor: kMedicationDarkColor, value: 80.555, taskName: "Medication", numberOfTasks: 6, asset: 'assets/icons/pharmacy-pills-icon.svg', path: '/medication'),
                  TaskCard(backgroundColor: kFitnessLightColor, foregroundColor: kFitnessDarkColor, value: 60, taskName: "Fitness", numberOfTasks: 3, asset: 'assets/icons/arm-muscles-icon.svg', path: '/fitness'),
                  TaskCard(backgroundColor: kRecreationLightColor, foregroundColor: kRecreationDarkColor,value: 41.6, taskName: "Recreation", numberOfTasks: 4, asset: 'assets/icons/playing-cards-icon.svg', path: '/recreation'),
                  TaskCard(backgroundColor: kSocializeLightColor, foregroundColor: kSocializeDarkColor, value: 89.8, taskName: "Socialize", numberOfTasks: 2, asset: 'assets/icons/comments-icon.svg', path: '/socialize')
                ],
              ),
          ),

        ],

      ),
    );
  }
}

class MotivationCard extends StatelessWidget {
  const MotivationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(19),
      decoration: const BoxDecoration(
        color: kProfileMotivationLightColor,
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset('assets/icons/quotation-mark-icon.svg', color: kProfileMotivationDarkColor, height: 20, width: 20,),
          ),
          const Expanded(child: Text("Associate with people who are likely to improve you.", style: TextStyle(color: kProfileMotivationDarkColor, fontWeight: FontWeight.w500),))
        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final Color backgroundColor;
  static const Radius radius = Radius.circular(20);
  final Color foregroundColor;
  final double? value;
  final String taskName;
  final int numberOfTasks;
  final String asset;
  final String path;

  const TaskCard({Key? key, required this.backgroundColor,
    required this.foregroundColor, this.value,
    required this.taskName,
    required this.numberOfTasks,
    required this.asset,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.of(context).pushNamed(path),
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(radius)
        ),
        child:Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Stack(
            children: [
               Positioned(
                   right: 10,
                   top: 20,
                   child:
                    SvgPicture.asset(asset,
                      color: foregroundColor.withOpacity(0.5),theme: const SvgTheme(),
                      width: 50, height: 50,  )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                  SizedBox(
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: CircularProgressIndicator(
                            strokeWidth: 6,
                            color: foregroundColor,
                            value: (value ?? 0) * 0.01,
                            backgroundColor: foregroundColor.withOpacity(0.3),
                          ),
                        ),
                         Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("${value?.ceil() ?? 0}%", style: TextStyle(color: foregroundColor, fontWeight: FontWeight.bold),),
                            )
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(taskName, style: TextStyle(color: foregroundColor, fontWeight: FontWeight.w900, fontSize: 17),),
                      const SizedBox(height: 10,),
                      Text("$numberOfTasks Tasks", style: TextStyle(color: foregroundColor, fontWeight: FontWeight.w600),),
                    ],
                  )
                ],
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 32,
                    width: 55,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(bottomRight: radius, topLeft: radius),
                      color: foregroundColor
                    ),
                    child: const Icon(Icons.arrow_right_alt_rounded, color: Colors.white,),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: kProfileAppBarBackgroundColor,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
        ),
        child: Column(
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: kProfileAppBarBackgroundColor,
              leading:  ProfileIcon(iconData: Icons.keyboard_arrow_left, onPress: (){

                Navigator.of(context).pop();

              },),
              title: const Text("My Profile", style: TextStyle(color: kProfileTitleColor),),
              centerTitle: true,
              actions: [
                ProfileIcon(iconData: Icons.mode_edit_outline_outlined,
                  onPress: (){
                    Navigator.of(context).pushNamed("/editProfile");
                  },
                )
              ],

            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const Expanded(
                      flex:1,
                       child: ProfilePicture()
                   ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: BlocBuilder<UserDataCubit, UserDataState>(
                      builder: (context, state) {
                        return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.username ?? 'Anonymous', style: const TextStyle(color: kProfileMainInfo, fontWeight: FontWeight.bold, fontSize: 18), ),
                          const SizedBox(height: 10,),
                          Text.rich(TextSpan(children: [
                            TextSpan(text: (state.age != null) ? "${state.age} yrs": "N/A"),
                            const TextSpan(text: ' - '),
                            TextSpan(text: (state.location != null) ? "${state.location}": "Unknown Locations")
                          ]), style: const TextStyle(color: kProfileSubInfo, fontWeight: FontWeight.w500),)
                        ],
                      );
  },
),
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}


