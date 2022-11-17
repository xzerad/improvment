part of 'user_data_cubit.dart';

@immutable
abstract class UserDataState {
  final String? username;
  final String? email;
  final int? age;
  final String? location;
  final BuildContext context;

  const UserDataState({this.username, this.email, this.age, this.location, required this.context});

}

class UserDataAsAnonymous extends UserDataState {
  const UserDataAsAnonymous({required super.context}): super(username: "Anonymous");
}

class UserDataAsGuest extends UserDataState {
  const UserDataAsGuest({required super.username, required super.context});
}

class UserDataAsLoggedIn extends UserDataState{
  const UserDataAsLoggedIn({required super.username, required super.location, required super.age, required super.email, required super.context});
}