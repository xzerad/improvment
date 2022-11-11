import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:improvment/models/drawer_cubit.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> slideAnimation;
  @override
  initState(){
    super.initState();
    _controller = AnimationController(vsync: this,
        duration: const Duration(milliseconds: 600));
    slideAnimation = Tween<double>(
      begin: 250,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff011f4c),
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 180, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding:  EdgeInsets.only(top: 8.0, bottom: 10.0),
              child:  CircleAvatar(radius: 50,child: Text("RC"),),
            ),
            Text("Radwan \nChaieb", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, fontSize: 35),),
            Expanded(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ListTile(
                    leading: Icon(Icons.analytics_outlined, color: Color(0xffb8c7ed),),
                    title: Text("Analytics", style: TextStyle(color: Colors.white),),
                    minLeadingWidth: 5,
                  ),
                  ListTile(
                    leading: Icon(Icons.settings_outlined, color: Color(0xffb8c7ed),),
                    title: Text("Settings", style: TextStyle(color: Colors.white),),
                    minLeadingWidth: 5,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

