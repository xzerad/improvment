import 'package:flutter/material.dart';
import 'package:improvment/components/auth_text.dart';

import '../components/custom_input.dart';
import '../constants.dart';

class LoginBody extends StatelessWidget {
  final BuildContext appContext;
  const LoginBody({Key? key, required this.appContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthHeader(header: "Log-In"),
          const SizedBox(height: 10,),
          Form(child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              const Text("Email", style: TextStyle(color: kMainGrayTextColor, fontWeight: FontWeight.w500, fontSize: 18),),
              const CustomFormInput(hint: "user@example.com",),
              const SizedBox(height: 10,),
              const Text("Password", style: TextStyle(color: kMainGrayTextColor, fontWeight: FontWeight.w500, fontSize: 18),),
              const CustomFormInput(hint: "Jg76%73&#",),
              SizedBox(
                  width: size.width,
                  child: InkWell(
                      onTap: (){
                        Navigator.of(NavigationAuthSingleton.navigator.currentContext!).pushReplacementNamed('/forgetPassword');
                      },
                      child: const Text("Forget Password?", textAlign: TextAlign.end, style: TextStyle(color: kMainGrayTextColor, fontWeight: FontWeight.w600, height: 2),))
              ),
              const SizedBox(height: 30,),
              Center(
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(appContext).pushReplacementNamed('/home');
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: kMedicationDarkColor),
                    child:const Padding(padding: EdgeInsets.symmetric(horizontal: 40), child: Text("Log In", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),),
                  )
              ),
              Center(child: SizedBox(
                  height: 30,
                  width: size.width,
                  child: Center(child: Text.rich(
                    TextSpan(children:[
                      const TextSpan(text: "you don't have an account? "),
                      WidgetSpan(child: InkWell(onTap: (){
                        Navigator.of(NavigationAuthSingleton.navigator.currentContext!).pushReplacementNamed('/signup');
                      }, child: const Text("SignUp", style: TextStyle(color: kProfileMainInfo, fontWeight: FontWeight.bold, fontSize: 15),),))
                    ] )
                    , style: const TextStyle(color: kMainGrayTextColor),),
                  )
              )
              ),
              const SizedBox(height: 10,),
              const SizedBox(height: 10,),
              Row(
                children: const [
                  Expanded(child: Divider(
                    endIndent: 10.0,
                    thickness: 2,
                  )),
                  Text("OR", style: TextStyle(color: kMainGrayTextColor, fontWeight: FontWeight.bold),),
                  Expanded(child: Divider(
                    indent: 10.0,
                    thickness: 2,

                  ))

                ],
              ),
              const SizedBox(height: 20,),
              Center(child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: kMainDarkBlueColor), child: const Text("Log In as Guest", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),)),
              const SizedBox(height: 30,),

            ],
          )
          )
        ],
      ),
    );
  }
}
