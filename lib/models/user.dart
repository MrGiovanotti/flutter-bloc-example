class User {
  String _name;
  int _age;

  User(this._name, this._age);

  String get name => this._name;
  int get age => this._age;

  set name(name) => this._name = name;
  set age(age) => this._age = age;
}
