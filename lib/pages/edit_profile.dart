import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:improvment/components/custom_input.dart';
import 'package:improvment/components/profile_picture.dart';
import 'package:improvment/constants.dart';
import 'package:improvment/models/profile_picture_cubit.dart';
import 'package:improvment/models/user_data_cubit.dart';

import '../components/custom_icon.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Edit Profile", style: TextStyle(color: kMainGrayTextColor),),
        centerTitle: true,
        leading: ProfileIcon(
          iconData: Icons.keyboard_arrow_left,
          onPress: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const EditBody(),
    );
  }
}

class EditBody extends StatefulWidget {
   const EditBody({Key? key}) : super(key: key);

  @override
  State<EditBody> createState() => _EditBodyState();
}

class _EditBodyState extends State<EditBody> {
  final String username = "Radwan Chaieb";

  final _formKey = GlobalKey<FormState>();

  bool showPassword = false;

  DateTime? birthDay;

  final TextEditingController _dayController = TextEditingController();

   final TextEditingController _monthController = TextEditingController();

   final TextEditingController _yearController = TextEditingController();

   final TextEditingController _usernameController = TextEditingController();

   @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: BlocBuilder<UserDataCubit, UserDataState>(
           builder: (context, state) {
              return Column(
                children: [
                  Column(
                     children: [
                          const SizedBox(height: 10,),
                          Center(child: Stack(
                                children: [
                                    const ProfilePicture(),
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: ActionIcon(icon: Icons.edit, onPress: () async{

                                           ImagePicker picker = ImagePicker();
                                           XFile? image = await picker.pickImage(source: ImageSource.gallery);
                                           if( image != null){
                                             if(mounted){
                                               context.read<ProfilePictureCubit>().setProfilePicture(image.path);
                                             }

                                           }


                                          // context.read<ProfilePictureCubit>().setProfilePicture('assets/images/profile.png');

                                        },)
                                    ),
                                    Positioned(
                                      bottom: 0,
                                        left: 0,
                                        child: ActionIcon(icon: Icons.delete_forever, color: Colors.red, onPress: (){
                                          context.read<ProfilePictureCubit>().deleteProfilePicture(context);
                                        },)
                                    )
                    ],
                  )),
                          const SizedBox(height: 10,),
                          Text(state.username??"Anonymous", style: const TextStyle(color: kProfileMainInfo, fontWeight: FontWeight.w700, fontSize: 18),),
                          const SizedBox(height: 10,),
                ],
              ),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                       key: _formKey,
                       child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             CustomFormInput(hint: "username", controller: _usernameController, validator: (value){
                                   if(value == null || value.isEmpty){
                                     return 'Please enter a valid username';
                                   }else{
                                     return null;
                                   }
                             },),
                             // TextFormField(
                             //   keyboardType: TextInputType.name,
                             //   controller: _usernameController,
                             //   decoration: const InputDecoration(
                             //       label: Text("Username", style: TextStyle(color: kMainGrayTextColor),),
                             //       fillColor: kFilledInputColor,
                             //       filled: true,
                             //       suffixIcon: Icon(Icons.account_circle_rounded, color: kMainGrayTextColor,),
                             //       enabledBorder: OutlineInputBorder(
                             //           borderSide: BorderSide(color: kFitnessDarkColor)
                             //
                             //       ),
                             //       focusedBorder: OutlineInputBorder(
                             //           borderSide: BorderSide(color: kMedicationDarkColor, width: 2)
                             //       ),
                             //       errorBorder: OutlineInputBorder(
                             //           borderSide: BorderSide(color: kRecreationDarkColor)
                             //       )
                             //   ),
                             //   validator: (value){
                             //     if(value == null || value.isEmpty){
                             //       return 'Please enter a valid username';
                             //     }else{
                             //       return null;
                             //     }
                             //   },
                             // ),
                             Builder(builder: (_){
                               switch (state.runtimeType){
                                 case UserDataAsLoggedIn:
                                   return Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       const SizedBox(height: 10,),
                                       CustomFormInput(hint: "Email Address", validator: (value){
                                         if(value == null || value.isEmpty){
                                           return 'Please enter a valid email';
                                         }else{
                                           return null;
                                         }
                                       },),
                                       // TextFormField(
                                       //   keyboardType: TextInputType.emailAddress,
                                       //   decoration: const InputDecoration(
                                       //       label: Text("Email Address", style: TextStyle(color: kMainGrayTextColor),),
                                       //       fillColor: kFilledInputColor,
                                       //       filled: true,
                                       //       suffixIcon: Icon(Icons.email, color: kMainGrayTextColor,),
                                       //       enabledBorder: OutlineInputBorder(
                                       //           borderSide: BorderSide(color: kFitnessDarkColor)
                                       //
                                       //       ),
                                       //       focusedBorder: OutlineInputBorder(
                                       //           borderSide: BorderSide(color: kMedicationDarkColor, width: 2)
                                       //       ),
                                       //       errorBorder: OutlineInputBorder(
                                       //           borderSide: BorderSide(color: kRecreationDarkColor)
                                       //       )
                                       //   ),
                                       //   validator: (value){
                                       //     if(value == null || value.isEmpty){
                                       //       return 'Please enter a valid email';
                                       //     }else{
                                       //       return null;
                                       //     }
                                       //   },
                                       // ),
                                       const SizedBox(height: 10,),
                                       StatefulBuilder(
                                           builder: (context, setState) {
                                             return CustomFormInput(hint: "Password", validator: (value){
                                               if(value == null || value.isEmpty){
                                                 return 'Please enter a valid password';
                                               }else{
                                                 return null;
                                               }
                                             },);
                                             // return TextFormField(
                                             //   keyboardType: TextInputType.visiblePassword,
                                             //   decoration: InputDecoration(
                                             //       label: const Text("Password", style: TextStyle(color: kMainGrayTextColor),),
                                             //       fillColor: kFilledInputColor,
                                             //       filled: true,
                                             //       focusColor: Colors.black,
                                             //       enabledBorder: const OutlineInputBorder(
                                             //           borderSide: BorderSide(color: kFitnessDarkColor)
                                             //
                                             //       ),
                                             //       focusedBorder: const OutlineInputBorder(
                                             //           borderSide: BorderSide(color: kMedicationDarkColor, width: 2)
                                             //       ),
                                             //       errorBorder: const OutlineInputBorder(
                                             //           borderSide: BorderSide(color: kRecreationDarkColor)
                                             //       ),
                                             //       suffixIcon: InkWell(
                                             //           onTap: (){
                                             //             setState((){
                                             //               showPassword = !showPassword;
                                             //             });
                                             //           },
                                             //           child: Icon(showPassword?Icons.lock_open_sharp:Icons.lock_sharp, color: kMainGrayTextColor,))
                                             //   ),
                                             //   obscureText: !showPassword,
                                             //   validator: (value){
                                             //     if(value == null || value.isEmpty){
                                             //       return 'Please enter a valid password';
                                             //     }else{
                                             //       return null;
                                             //     }
                                             //   },
                                             //
                                             // );
                                           }
                                       ),
                                       const SizedBox(height: 10,),
                                       const Text('Birth Date', style: TextStyle(color: kMainGrayTextColor, fontWeight: FontWeight.w500),),
                                       const SizedBox(height: 3,),
                                       Row(
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children:  [
                                           Expanded(child: CustomFormInput(hint: "day", validator: (value){
                                             int? day = int.tryParse(value ?? '');
                                             if(day == null || day<0 || day > 31){
                                               return 'Invalid Day';
                                             }else{
                                               return null;
                                             }
                                           },)
                                             //  TextFormField(
                                             //   controller: _dayController,
                                             //   keyboardType: TextInputType.number,
                                             //   decoration: const InputDecoration(
                                             //       label: Text("day", style: TextStyle(color: kMainGrayTextColor),),
                                             //       fillColor: kFilledInputColor,
                                             //       filled: true,
                                             //       enabledBorder: OutlineInputBorder(
                                             //           borderSide: BorderSide(color: kFitnessDarkColor)
                                             //
                                             //       ),
                                             //       focusedBorder: OutlineInputBorder(
                                             //           borderSide: BorderSide(color: kMedicationDarkColor, width: 2)
                                             //       ),
                                             //       errorBorder: OutlineInputBorder(
                                             //           borderSide: BorderSide(color: kRecreationDarkColor)
                                             //       )
                                             //   ),
                                             //
                                             //   validator: (value){
                                             //     int? day = int.tryParse(value ?? '');
                                             //     if(day == null || day<0 || day > 31){
                                             //       return 'Invalid Day';
                                             //     }else{
                                             //       return null;
                                             //     }
                                             //   },
                                             // )
                                           ),
                                           const SizedBox(width: 5,),
                                           Expanded(child:
                                           CustomFormInput(hint: "month", validator: (value){
                                             int? month = int.tryParse(value ?? '');
                                             if(month == null || month < 1 || month > 12){
                                               return 'Invalid Month';
                                             }else{
                                               return null;
                                             }
                                           },)
                                             //  TextFormField(
                                             //   controller: _monthController,
                                             //   keyboardType: TextInputType.number,
                                             //   decoration: const InputDecoration(
                                             //       label: Text("month", style: TextStyle(color: kMainGrayTextColor),),
                                             //       fillColor: kFilledInputColor,
                                             //       filled: true,
                                             //       enabledBorder: OutlineInputBorder(
                                             //           borderSide: BorderSide(color: kFitnessDarkColor)
                                             //
                                             //       ),
                                             //       focusedBorder: OutlineInputBorder(
                                             //           borderSide: BorderSide(color: kMedicationDarkColor, width: 2)
                                             //       ),
                                             //       errorBorder: OutlineInputBorder(
                                             //           borderSide: BorderSide(color: kRecreationDarkColor)
                                             //       )
                                             //   ),
                                             //   validator: (value){
                                             //     int? month = int.tryParse(value ?? '');
                                             //     if(month == null || month < 1 || month > 12){
                                             //       return 'Invalid Month';
                                             //     }else{
                                             //       return null;
                                             //     }
                                             //   },
                                             // )
                                           ),
                                           const SizedBox(width: 5,),
                                           Expanded(child:
                                           CustomFormInput(hint: "year", validator: (value){
                                             int? year = int.tryParse(value?? '');
                                             var currentYear = DateTime.now().year;
                                             if(year == null || year < 1800 || year > currentYear){
                                               return 'Invalid Year';
                                             }else{
                                               return null;
                                             }
                                           },)
                                             // TextFormField(
                                             //   controller: _yearController,
                                             //   keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
                                             //   decoration: const InputDecoration(
                                             //       label: Text("year", style: TextStyle(color: kMainGrayTextColor),),
                                             //       fillColor: kFilledInputColor,
                                             //       filled: true,
                                             //       enabledBorder: OutlineInputBorder(
                                             //           borderSide: BorderSide(color: kFitnessDarkColor)
                                             //
                                             //       ),
                                             //       focusedBorder: OutlineInputBorder(
                                             //           borderSide: BorderSide(color: kMedicationDarkColor, width: 2)
                                             //       ),
                                             //       errorBorder: OutlineInputBorder(
                                             //           borderSide: BorderSide(color: kRecreationDarkColor)
                                             //       )
                                             //   ),
                                             //   validator: (value){
                                             //     int? year = int.tryParse(value?? '');
                                             //     var currentYear = DateTime.now().year;
                                             //     if(year == null || year < 1800 || year > currentYear){
                                             //       return 'Invalid Year';
                                             //     }else{
                                             //       return null;
                                             //     }
                                             //   },
                                             // )
                                           ),
                                           const SizedBox(width: 5,),
                                           InkWell(
                                               onTap: () async{
                                                 var now = DateTime.now();
                                                 var pickedDate = await showDatePicker(
                                                     context: context,
                                                     initialDate: now,
                                                     firstDate: now.subtract(const Duration(days: 5000)),
                                                     lastDate: now);
                                                 _dayController.text = pickedDate?.day.toString() ?? '';
                                                 _monthController.text = pickedDate?.month.toString() ?? '';
                                                 _yearController.text = pickedDate?.year.toString() ?? '';


                                               },
                                               child: const Icon(Icons.calendar_month, size: 30, color: kMainGrayTextColor,)
                                           )
                                         ],
                                       ),
                                       const SizedBox(height: 10,),
                                       CustomFormInput(hint: "Location", validator: (value){
                                         if(value == null || value.isEmpty){
                                           return 'Please enter a valid location';
                                         }else{
                                           return null;
                                         }
                                       },)
/*
                                       TextFormField(
                                         keyboardType: TextInputType.name,
                                         decoration: const InputDecoration(
                                             label: Text("Location", style: TextStyle(color: kMainGrayTextColor),),
                                             fillColor: kFilledInputColor,
                                             filled: true,
                                             suffixIcon: Icon(Icons.edit_location_alt_rounded, color: kMainGrayTextColor,),
                                             enabledBorder: OutlineInputBorder(
                                                 borderSide: BorderSide(color: kFitnessDarkColor)

                                             ),
                                             focusedBorder: OutlineInputBorder(
                                                 borderSide: BorderSide(color: kMedicationDarkColor, width: 2)
                                             ),
                                             errorBorder: OutlineInputBorder(
                                                 borderSide: BorderSide(color: kRecreationDarkColor)
                                             )
                                         ),
                                         validator: (value){
                                           if(value == null || value.isEmpty){
                                             return 'Please enter a valid location';
                                           }else{
                                             return null;
                                           }
                                         },
                                       ),
*/
                                     ],
                                   );


                                 default:
                                   return const SizedBox(height: 10,);
                               }
                             }),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(backgroundColor: kMedicationDarkColor),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          context.read<UserDataCubit>().setUsername(username: _usernameController.text, context: context);
                                        }
                                      },
                                      child: const Text('Update'),
                                    ),
                                  ),
                                ),
                        ],
                      )),
                    )

          ],
        );
  },
),
      ),
    );
  }
}

class ActionIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final Function()? onPress;
  const ActionIcon({Key? key, required this.icon, this.color, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPress,
        child: CircleAvatar(radius: 10, backgroundColor: color, foregroundColor: Colors.white, child: Icon(icon, size: 15,) ,));
  }
}
