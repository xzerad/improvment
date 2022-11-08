import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff011f4c),
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 180, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding:  EdgeInsets.only(top: 8.0, bottom: 10.0),
                  child:  CircleAvatar(radius: 50,child: Text("RC"),),
                ),
                GestureDetector(
                  onTap: (){
                    setState((){
                      menuOffset = 0;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: const Color(0xffb8c7ed))
                    ),
                    child: const Icon(Icons.arrow_back_ios_outlined, color: Color(0xffb8c7ed),),
                  ),
                )
              ],
            ),
            Text("Radwan \nChaieb", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, fontSize: 35),),
            Expanded(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ListTile(
                    leading: Icon(Icons.bookmark_outline, color: Color(0xffb8c7ed),),
                    title: Text("Templates", style: TextStyle(color: Colors.white),),
                    minLeadingWidth: 5,
                  ),
                  ListTile(
                    leading: Icon(Icons.category_outlined, color: Color(0xffb8c7ed),),
                    title: Text("Categories", style: TextStyle(color: Colors.white),),
                    minLeadingWidth: 5,
                  ),
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
    ),;
  }
}
