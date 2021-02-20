import 'dart:async';

import 'package:bloc_example/bloc/users/users_events.dart';
import 'package:bloc_example/bloc/users/users_state.dart';
import 'package:bloc_example/models/user.dart';

class UsersBloc {
  UsersState _usersState = UsersState();

  StreamController<UsersEvent> _input = StreamController();
  StreamController<List<User>> _output = StreamController();

  Stream<List<User>> get usersStream => _output.stream;
  StreamSink<UsersEvent> get usersSink => _input.sink;

  UsersBloc() {
    _input.stream.listen(onEvent);
  }

  void onEvent(UsersEvent event) {
    if (event is AddUserEvent) {
      _usersState.addUser(event.user);
    } else if (event is RemoveUserEvent) {
      _usersState.removeUser(event.user);
    }
    _output.add(_usersState.users);
  }

  dispose() {
    _input.close();
    _output.close();
  }
}
