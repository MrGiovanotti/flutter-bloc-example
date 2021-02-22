import 'package:bloc_example/bloc/users/users_bloc.dart';
import 'package:bloc_example/bloc/users/users_events.dart';
import 'package:bloc_example/models/user.dart';
import 'package:bloc_example/utils/routes_utils.dart';
import 'package:flutter/material.dart';

class AddUserScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  final UsersBloc _usersBloc = UsersBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Edad'),
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              onPressed: () {
                User user =
                    User(_nameController.text, int.parse(_ageController.text));
                _usersBloc.usersSink.add(AddUserEvent(user));
                Navigator.pushNamedAndRemoveUntil(
                    context, RoutesUtils.HOME, (route) => false);
              },
              child: Text('Guardar'),
            )
          ],
        ),
      ),
    );
  }
}
