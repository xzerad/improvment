import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:improvment/models/profile_picture_cubit.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(BuildContext context) : super( UserDataAsAnonymous(context: context));

  setUsername({required String username, required BuildContext context}) async{
    switch(state.runtimeType){
      case UserDataAsAnonymous:
        emit(UserDataAsGuest(username: username, context: context));
        break;
      case UserDataAsGuest:
        emit(UserDataAsGuest(username: username, context: context));
        break;
      case UserDataAsLoggedIn:
        emit(UserDataAsLoggedIn(username: username, location: state.location, age: state.age, email: state.email, context: context));
        break;
    }
    context.read<ProfilePictureCubit>().updateProfilePicture(context);

  }
}
