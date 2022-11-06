import 'package:flutter/material.dart';


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

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          child: Row(
            children: [
              SizedBox(
                width: size.width*.25,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Expanded(child: SizedBox()),
                      CircleAvatar(child: Text("RC"),),
                      Text("Account"),
                      Text("Settings"),
                      Text("Logout"),
                      Expanded(child: SizedBox()),


                    ],
                  ),
                ),
              ),
              Expanded(child: SizedBox())
            ],
          ),
        ),


          Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("hello"),
                Text("hello"),
                Text("hello")

              ],
            ),
          )

      ],
    );
  }
}

