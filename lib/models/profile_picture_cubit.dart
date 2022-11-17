import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:improvment/models/user_data_cubit.dart';

part 'profile_picture_state.dart';

class ProfilePictureCubit extends Cubit<ProfilePictureState> {
  ProfilePictureCubit({required username}) : super(ProfilePictureInitial(path: username));

  setProfilePicture(String path) async{
    emit(ProfilePictureUploaded(path: path));
  }

  deleteProfilePicture(BuildContext context) async{
    emit(ProfilePictureInitial(path: BlocProvider.of<UserDataCubit>(context).state.username ?? 'Anonymous'));
  }

  updateProfilePicture(BuildContext context) async{
    if(state.runtimeType == ProfilePictureInitial){
      deleteProfilePicture(context);
    }
  }

}
