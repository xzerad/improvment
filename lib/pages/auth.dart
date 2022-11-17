import 'package:flutter/material.dart';
import 'package:improvment/constants.dart';
import 'package:improvment/pages/forget_password.dart';
import 'package:improvment/pages/signup.dart';
import 'login.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthBody(),
    );
  }
}

class AuthBody extends StatefulWidget {
  const AuthBody({Key? key}) : super(key: key);

  @override
  State<AuthBody> createState() => _AuthBodyState();
}


class _AuthBodyState extends State<AuthBody> {

  var routeBuilder = {
    '/': (context, appContext)=> LoginBody(appContext: appContext),
    '/forgetPassword': (context, appContext) => const ForgetPasswordBody(),
    '/signup': (context, appContext) => const SignupBody(),
  };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: SizedBox(
          child: Stack(
            children: [
              SizedBox(
                height: 300,
                width: size.width,
                child: Image.asset('assets/images/stars.jpg', repeat: ImageRepeat.repeat,),
              ),
              Container(
                margin: const EdgeInsets.only(top: 200),
                constraints: BoxConstraints(
                  minHeight: size.height - 200,
                ),
                width: size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                  color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IntrinsicHeight(
                    child: Navigator(
                        key: NavigationAuthSingleton.navigator,
                        initialRoute: '/',
                        onGenerateRoute: (setting){
                          return PageRouteBuilder(
                            transitionsBuilder: (context, animation, secondaryAnimation, child){
                              const begin = Offset(1, 0);
                              const end = Offset.zero;
                              var curve = Curves.easeInBack;
                              var curveTween = CurveTween(curve: curve);
                              final tween = Tween(begin: begin, end: end).chain(curveTween);
                              final offsetAnimation = animation.drive(tween);

                              return SlideTransition(position: offsetAnimation, child: child);
                            },
                              transitionDuration: const Duration(milliseconds: 500),
                              pageBuilder: (localContext, animation, secondaryAnimation){
                            return routeBuilder[setting.name]!(localContext, context);
                          });
                        },
                    ),
                  ),
                ),
              ),
              Positioned(
                  right: -5,
                  top: 105,
                  child: Image.asset('assets/images/sloth.png',)
              )
            ],

          ),
        ),
      ),
    );
  }
}



