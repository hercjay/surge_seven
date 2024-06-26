

import 'package:surge_seven/config/constants.dart';
import 'package:surge_seven/core/data/types.dart';
import 'package:surge_seven/features/user/domain/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String userId,
    required String userType,
    required String subscriptionType,
    required String photo,
    required String email,
    required String password,
    required String status,
    required String firstname,
    required String lastname,
    required DateTime dateRegistered,
    required DateTime updatedAt,
  }) : super(
          userId: userId,
          userType: userType,
          subscriptionType: subscriptionType,
          photo: photo,
          email: email,
          password: password,
          status: status,
          firstname: firstname,
          lastname: lastname,
          dateRegistered: dateRegistered,
          updatedAt: updatedAt,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'],
      userType: json['user_type'] ?? UserTypes.Client,
      subscriptionType: json['subscription_type'] ?? SubscriptionTypes.Free,
      photo: (json['photo'] != null && json['photo'] != "")
          ? json['photo'].toString()
          : "",
      email: json['email'] ?? "",
      password: json['password'] ?? "",
      status: json['status'] ?? 0,
      firstname: json['firstname'] ?? "",
      lastname: json['lastname'] ?? "",
      dateRegistered: json['date_registered'] ?? DateTime.now(),
      updatedAt: json['updated_at'] ?? DateTime.now(),
    );
  }

  factory UserModel.fromLocalJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'],
      userType: json['user_type'] ?? UserTypes.Client,
      subscriptionType: json['subscription_type'] ?? SubscriptionTypes.Free,
      photo: (json['photo'] != null && json['photo'] != "")
          ? json['photo'].toString()
          : "",
      email: json['email'] ?? "",
      password: json['password'] ?? "",
      status: json['status'] ?? 0,
      firstname: json['firstname'] ?? "",
      lastname: json['lastname'] ?? "",
      dateRegistered: DateTime.tryParse(json['date_registered'] ??
          json['date_registered'] ??
          DateTime.now())!,
      updatedAt: DateTime.tryParse(
          json['updated_at'] ?? json['updated_at'] ?? DateTime.now())!,
    );
  }

  // factory UserModel.fromMysqlResults(Results results) {

  // }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'user_type': userType,
      'subscription_type': subscriptionType,
      'photo': photo,
      'email': email,
      'password': password,
      'status': status,
      'firstname': firstname,
      'lastname': lastname,
      'date_registered': dateRegistered.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory UserModel.fromEntity(UserEntity userEntity) {
    dPrint('userEntity.updatedAt: ${userEntity.updatedAt}');
    return UserModel(
      userId: userEntity.userId,
      userType: userEntity.userType,
      subscriptionType: userEntity.subscriptionType,
      photo: userEntity.photo,
      email: userEntity.email,
      password: userEntity.password,
      status: userEntity.status,
      firstname: userEntity.firstname,
      lastname: userEntity.lastname,
      dateRegistered: userEntity.dateRegistered,
      updatedAt: userEntity.updatedAt,
    );
  }

  factory UserModel.copyWith(UserEntity userEntity) {
    return UserModel(
      userId: userEntity.userId,
      userType: userEntity.userType,
      subscriptionType: userEntity.subscriptionType,
      photo: userEntity.photo,
      email: userEntity.email,
      password: userEntity.password,
      status: userEntity.status,
      firstname: userEntity.firstname,
      lastname: userEntity.lastname,
      dateRegistered: userEntity.dateRegistered,
      updatedAt: userEntity.updatedAt,
    );
  }
}
