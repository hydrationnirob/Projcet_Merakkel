// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:isar/isar.dart';

part 'UserModel.g.dart';


@collection
class UserModel {

  Id id=Isar.autoIncrement;
  String Name;
  String Email;
  String Password;
  UserModel({
    this.id=Isar.autoIncrement,
    required this.Name,
    required this.Email,
    required this.Password,
  });



  UserModel copyWith({
    Id? id=Isar.autoIncrement,
    String? Name,
    String? Email,
    String? Password,
  }) {
    return UserModel(
      id : id ?? this.id,
      Name: Name ?? this.Name,
      Email: Email ?? this.Email,
      Password: Password ?? this.Password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'Name': Name,
      'Email': Email,
      'Password': Password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id : map['id'],
      Name: map['Name'] as String,
      Email: map['Email'] as String,
      Password: map['Password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id=Isar.autoIncrement: $id=Isar.autoIncrement, Name: $Name, Email: $Email, Password: $Password)';
  }


  @override
  int get hashCode {
    return id=Isar.autoIncrement.hashCode ^
      Name.hashCode ^
      Email.hashCode ^
      Password.hashCode;
  }
}
