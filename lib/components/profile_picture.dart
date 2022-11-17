import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:improvment/constants.dart';
import '../models/profile_picture_cubit.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePictureCubit, ProfilePictureState>(
      builder: (context, state) {
        switch(state.runtimeType){
          case ProfilePictureInitial:
            return CircleAvatar(radius: 40, backgroundColor: kSocializeDarkColor, foregroundColor: Colors.white, child: Text(_getUsernameLogo(state.path), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
              ,);
          case ProfilePictureUploaded:return CircleAvatar(radius: 40, foregroundImage: Image.file(File(state.path)).image,);
          default:
            return CircleAvatar(radius: 40, child: Text(_getUsernameLogo(state.path)),);
        }

      },
    );
  }

  String _getUsernameLogo(String username){
    return username.split(" ").map((e) => e[0]).join('').toUpperCase();
  }
}
