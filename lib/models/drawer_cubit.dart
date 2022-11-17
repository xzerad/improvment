import 'package:flutter/animation.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super( const DrawerClosed());

  Future<void> closeDrawer() async {
    emit( const DrawerClosed());
  }

  Future<void> openDrawer() async {
    emit( const DrawerOpened());
  }

  Future<void> openDrawerBy(double width) async{
    emit(DrawerOpened(width: width));
  }
  Future<void> closeDrawerBy(double width) async{
    emit(DrawerClosed(width: width));
  }

}
