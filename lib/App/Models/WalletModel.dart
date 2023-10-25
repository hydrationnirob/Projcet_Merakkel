// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:isar/isar.dart';

part 'WalletModel.g.dart';

@collection
class WalletModel {
  Id id=Isar.autoIncrement;
  String Title;
  DateTime LastPaid;
  String Amount;
  String TagetAmount;
  int TotalAmount;

  WalletModel({
    this.id=Isar.autoIncrement,
    required this.Title,
    required this.LastPaid,
    required this.Amount,
    required this.TagetAmount,
    required this.TotalAmount,
  });


  WalletModel copyWith({
    Id? id=Isar.autoIncrement,
    String? Title,
    DateTime? LastPaid,
    String? Amount,
    String? TagetAmount,
    int? TotalAmount,
  }) {
    return WalletModel(
      id : id ?? this.id,
      Title: Title ?? this.Title,
      LastPaid: LastPaid ?? this.LastPaid,
      Amount: Amount ?? this.Amount,
      TagetAmount: TagetAmount ?? this.TagetAmount,
      TotalAmount: TotalAmount ?? this.TotalAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'Title': Title,
      'LastPaid': LastPaid.millisecondsSinceEpoch,
      'Amount': Amount,
      'TagetAmount': TagetAmount,
      'TotalAmount': TotalAmount,
    };
  }

  factory WalletModel.fromMap(Map<String, dynamic> map) {
    return WalletModel(
      id : map['id'],
      Title: map['Title'] as String,
      LastPaid: DateTime.fromMillisecondsSinceEpoch(map['LastPaid'] as int),
      Amount: map['Amount'] as String,
      TagetAmount: map['TagetAmount'] as String,
      TotalAmount: map['TotalAmount'] as int,

    );
  }

  String toJson() => json.encode(toMap());

  factory WalletModel.fromJson(String source) => WalletModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WalletModel(id=Isar.autoIncrement: $id=Isar.autoIncrement, Title: $Title, LastPaid: $LastPaid, Amount: $Amount, TagetAmount: $TagetAmount), TotalAmount: $TotalAmount)';
  }

  @override
  int get hashCode {
    return id=Isar.autoIncrement.hashCode ^
      Title.hashCode ^
      LastPaid.hashCode ^
      Amount.hashCode ^
      TagetAmount.hashCode ^
      TagetAmount.hashCode ;
  }
}

