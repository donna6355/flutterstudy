class User {
  String id;
  String nickname;

  User({
    required this.id,
    required this.nickname,
  });
}

class UserManager {
  late User _user;
  User get user => _user;

  set setUser(User newUser) {
    _user = newUser;
    print(_user.id);
  }
}

//to read n write the protected object, use set and get keyword!!