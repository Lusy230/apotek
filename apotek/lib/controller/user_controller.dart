import 'package:apotek/models/user_data.dart';

class UserController {
  UserData userData = UserData(
    fullName: '',
    birthPlace: '',
    gender: '',
    username: '',
    password: '',
  );

  void setUserData(UserData data) {
    this.userData = data;
  }

  UserData getUserData() {
    return this.userData;
  }
}