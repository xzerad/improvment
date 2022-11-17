part of 'profile_picture_cubit.dart';

@immutable
abstract class ProfilePictureState {
   final String path;
   const ProfilePictureState({required this.path});
}

class ProfilePictureInitial extends ProfilePictureState {
  const ProfilePictureInitial({required super.path});
}

class ProfilePictureUploaded extends ProfilePictureState {
   const ProfilePictureUploaded({required super.path});
}
