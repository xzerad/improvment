import 'package:flutter/material.dart';

import '../constants.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeBody()
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with SingleTickerProviderStateMixin{
  double menuOffset = 0;
  bool dragActionIsActive = false;

  late AnimationController _controller;
  late Animation<double> slideAnimation;
  @override
  initState(){
    super.initState();
    _controller = AnimationController(vsync: this,
        duration: const Duration(milliseconds: 600));
    slideAnimation = Tween<double>(
      begin: 0,
      end: 150,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [

        Positioned(
            left: menuOffset,
            child: GestureDetector(
              onHorizontalDragUpdate: (value){
                double dx = menuOffset + value.delta.dx;
                double localDx = value.localPosition.dx;
                if( (localDx > 0 && localDx < 60) || dragActionIsActive){
                  if(  dx > 0  && dx < 250){
                    setState((){
                      menuOffset = dx;
                      dragActionIsActive = true;
                    });
                  }

                }
              },
              onHorizontalDragEnd: (v){
                setState((){
                  dragActionIsActive = false;
                });
              },
              child: Container(
                height: size.height,
                width: size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    AppBar(
                      leading: Builder(builder: (context){
                        return IconButton(onPressed: (){
                          setState((){
                            menuOffset = 250;
                          });
                        }, icon: const Icon(Icons.menu));
                      },),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      foregroundColor: kPrimaryColor,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text("hello"),
                        Text("hello"),
                        Text("hello")

                      ],
                    ),
                  ],
                ),
              ),
            ),
          )

      ],
    );
  }
}

