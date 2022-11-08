part of 'drawer_cubit.dart';

@immutable
abstract class DrawerState {
  const DrawerState();
}

class DrawerOpened extends DrawerState {
  const DrawerOpened();
}

class DrawerIsOpening extends DrawerState {
  const DrawerIsOpening();
}

class DrawerIsClosing extends DrawerState {
  const DrawerIsClosing();
}


class DrawerClosed extends DrawerState {
  const DrawerClosed();
}
