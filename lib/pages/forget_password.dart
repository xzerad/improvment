import 'package:flutter/material.dart';
import 'package:improvment/constants.dart';

import '../components/custom_input.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
        Row(
          children: const [
            Expanded(
              child: Text(
              "Forgot password", style: TextStyle( fontSize: 30, color: kMainDarkBlueColor, fontFamily: "HennyPenny", height: 2),
              ),
            ),
            SizedBox(width: 200,)
          ],
        ),
          const SizedBox(height: 10,),
          Form(child:
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const SizedBox(height: 10,),
          const Text("Email", style: TextStyle(color: kMainGrayTextColor, fontWeight: FontWeight.w500, fontSize: 18),),
          const CustomFormInput(hint: "user@example.com",),
            const SizedBox(height: 20,),

            Center(
                child: ElevatedButton(
                  onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("Please check your email")));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: kMedicationDarkColor),
                  child:const Padding(padding: EdgeInsets.symmetric(horizontal: 40), child: Text("Submit", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),),
                )
            ),

          ])),
          const SizedBox(height: 15,),
          Center(
            child: InkWell(
                onTap: (){
                  Navigator.of(NavigationAuthSingleton.navigator.currentContext!).pushNamed('/');
                },
                child: const Text("Go Back to login", style: TextStyle(color: kMainGrayTextColor, fontWeight: FontWeight.w500, fontSize: 17),)),
          )
        ],
      ),
    );
  }
}
