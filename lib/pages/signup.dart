import 'package:flutter/material.dart';

import '../components/auth_text.dart';
import '../components/custom_input.dart';
import '../constants.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthHeader(header: "Sign-Up"),
          const SizedBox(height: 10,),
          Form(child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: kProfileSubInfo.withOpacity(0.5),
                      foregroundColor: kMainDarkBlueColor,
                      radius: 45,
                      child: const Icon(Icons.camera_alt,),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              const Text("Username", style: TextStyle(color: kMainGrayTextColor, fontWeight: FontWeight.w500, fontSize: 18),),
              const CustomFormInput(hint: "Hidden Tiger",),
              const SizedBox(height: 10,),
              const Text("Email", style: TextStyle(color: kMainGrayTextColor, fontWeight: FontWeight.w500, fontSize: 18),),
              const CustomFormInput(hint: "user@example.com",),
              const SizedBox(height: 10,),
              const Text("Password", style: TextStyle(color: kMainGrayTextColor, fontWeight: FontWeight.w500, fontSize: 18),),
              const CustomFormInput(hint: "Jg76%73&#",),
              const SizedBox(height: 10,),
              const Text("Confirm Password", style: TextStyle(color: kMainGrayTextColor, fontWeight: FontWeight.w500, fontSize: 18),),
              const CustomFormInput(hint: "Jg76%73&#",),

              const SizedBox(height: 30,),
              Center(
                  child: ElevatedButton(
                    onPressed: (){
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: kMedicationDarkColor),
                    child:const Padding(padding: EdgeInsets.symmetric(horizontal: 40), child: Text("Sign Me Up", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),),
                  )
              ),
              const SizedBox(height: 15,),
              Center(
                child: InkWell(
                    onTap: (){
                      Navigator.of(NavigationAuthSingleton.navigator.currentContext!).pushNamed('/');
                    },
                    child: const Text("Go Back to login", style: TextStyle(color: kMainGrayTextColor, fontWeight: FontWeight.w500, fontSize: 17),)),
              )

            ],
          )
          )



        ],
      ),
    );
  }
}
