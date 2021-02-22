import 'package:bloc_example/bloc/users/users_bloc.dart';
import 'package:bloc_example/bloc/users/users_events.dart';
import 'package:bloc_example/models/user.dart';
import 'package:bloc_example/utils/routes_utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UsersBloc _usersBloc = UsersBloc();

  @override
  void dispose() {
    super.dispose();
    _usersBloc.dispose();
  }

  @override
  void initState() {
    super.initState();
    _usersBloc.usersSink.add(GetUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    _usersBloc.usersSink.add(GetUsersEvent());
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Users List'),
        ),
        body: _createListView(_usersBloc),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesUtils.ADD_USER);
          },
          child: Icon(Icons.person_add),
        ),
      ),
    );
  }

  Widget _createListView(UsersBloc usersBloc) {
    return StreamBuilder(
      stream: usersBloc.usersStream,
      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return Center(
              child: Text('There is not data'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.person),
                title: Text(snapshot.data[index].name),
                subtitle: Text('Edad: ' + snapshot.data[index].age.toString()),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
