import 'package:bloc_example/models/user.dart';

class UsersState {
  List<User> _users = [];

  UsersState._();
  static UsersState _instance = UsersState._();
  factory UsersState() => _instance;

  List<User> get users => _users;

  void addUser(User user) {
    _users.add(user);
  }

  void removeUser(User user) {
    _users.remove(user);
  }
}
