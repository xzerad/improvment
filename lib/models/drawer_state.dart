part of 'drawer_cubit.dart';

@immutable
abstract class DrawerState {
  final double drawerOpeningSize;
  const DrawerState({this.drawerOpeningSize = 0});
}

class DrawerOpened extends DrawerState {
  const DrawerOpened({width=250.0}): super(drawerOpeningSize: width);
}


class DrawerClosed extends DrawerState {
  const DrawerClosed({width=0.0}): super(drawerOpeningSize: width);
}
