import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart' show DateFormat;

enum UserState { available, away, busy }

class User {
  String id = UniqueKey().toString();
  String? name;
  String? email;
  String? gender;
  DateTime? dateOfBirth;
  String? avatar;
  String? address;
  UserState? userState;

  User.init();
  User.basic(this.name, this.avatar, this.userState);

  User.advanced(this.name, this.email, this.gender, this.dateOfBirth,
      this.avatar, this.address, this.userState);

  User getCurrentUser() {
    return User.advanced(
      'Herry Prasetyo',
      'herry081288@gmail.com',
      'Male',
      DateTime(1988, 12, 08),
      'img/user2.jpg',
      'Bekasi Timur, 17111',
      UserState.available,
    );
  }

  getDateOfBirth() {
    return DateFormat('yyyy-MM-dd').format(this.dateOfBirth!);
  }
}
