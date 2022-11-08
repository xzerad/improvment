import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(const DrawerClosed());

  Future<void> closeDrawer() async {
    emit(const DrawerClosed());
  }

  Future<void> openDrawer() async {
    emit(const DrawerOpened());
  }
}
