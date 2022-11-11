import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super( DrawerClosed());

  Future<void> closeDrawer() async {
    emit( DrawerClosed());
  }

  Future<void> openDrawer() async {
    emit( DrawerOpened());
  }

  Future<void> openDrawerBy(double width) async{
    emit(DrawerOpened(width: width));
  }
  Future<void> closeDrawerBy(double width) async{
    emit(DrawerClosed(width: width));
  }

}
