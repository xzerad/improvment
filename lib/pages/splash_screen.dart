import 'dart:math';

import 'package:flutter/material.dart';
import 'package:improvment/constants.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    animation = Tween<double>(begin: 0, end: 3.14).animate(_controller);
    _controller.forward();
    animation.addListener(() {
      if(animation.isDismissed){
        _controller.forward();
      }
      else if(animation.isCompleted){
        _controller.forward(from: 0);
      }
      setState((){});
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  double bottom = -25;
  double scale = 0;
  bool gestureAnimationCompleted = false;
  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;

      return SafeArea(
        child: Scaffold(
          body: Stack(
            children:  [

              SizedBox(
                height: size.height,
                width: size.width,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: ClipRect(
                    child: Align(
                      alignment: const Alignment(0.03, 0),
                      widthFactor: 0.35 + scale,
                      heightFactor: 1 + scale*2.5,
                      child: Image.asset("assets/images/stars.jpg",),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height*.15,
                child: SizedBox(
                  width: size.width,
                  child: const Padding(
                    padding:  EdgeInsets.all(15.0),
                    child:  Text("Improvement is a journey through unfamiliar failures",
                      textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'HennyPenny'),),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: (size.width/2)-30,
                child: Container(
                  height: 125,
                  width: 60,
                  decoration: BoxDecoration(
                      color: const Color(0xddcccbcc),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.keyboard_arrow_up_rounded, color: Colors.black.withOpacity(sin(animation.value))),
                      Icon(Icons.keyboard_arrow_up_rounded, color: Colors.black.withOpacity(sin((animation.value + .78) % 3.14))),
                      Icon(Icons.keyboard_arrow_up_rounded, color: Colors.black.withOpacity(sin((animation.value + 1.57) % 3.14))),

                    ],
                  ),
                ),

              ),
              StatefulBuilder(
                builder: (context, setState) {
                  return Positioned(
                      bottom: -bottom,
                      right: (size.width/2)-25,

                      child:  GestureDetector(
                          onVerticalDragUpdate: (value){
                            double delta = value.delta.dy;
                            if(delta < 0){
                              if(bottom > -90 ){
                                setState((){
                                  bottom += delta;
                                  scale += delta *0.002;

                                });
                              }else if(bottom <= -90) {
                                setState((){
                                  gestureAnimationCompleted = true;
                                });
                                  Navigator.of(context).pushReplacementNamed('/login');
                              }

                            }else{
                              if(bottom + delta < -25){
                                setState((){
                                  bottom += delta;
                                  scale += delta *0.002;
                                });
                              }
                            }
                          },
                          onVerticalDragEnd: (v){
                            if(!gestureAnimationCompleted){
                              setState((){
                                bottom = -25;
                                scale = 0;
                              });
                            }

                          },

                          child: const CircleAvatar(radius: 25, backgroundColor: Colors.white, foregroundColor: kFitnessDarkColor,child: Text("Go", style: TextStyle(fontWeight: FontWeight.bold),),)
                      )
                  );
                }
              ),

            ],
          ),
        ),
      );

  }
}
