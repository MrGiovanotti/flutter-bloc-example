import 'package:bloc_example/models/user.dart';

abstract class UsersEvent {}

class AddUserEvent extends UsersEvent {
  final User user;
  AddUserEvent(this.user);
}

class RemoveUserEvent extends UsersEvent {
  final User user;
  RemoveUserEvent(this.user);
}
