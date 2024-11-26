class UserData {
  static final UserData _singleton = UserData._internal();

  factory UserData() {
    return _singleton;
  }

  UserData._internal();

  String nome = '';
  String login = '';
  String senha = '';
}

final userData = UserData();
