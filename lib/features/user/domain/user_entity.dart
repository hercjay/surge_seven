import 'package:surge_seven/core/data/types.dart';

class UserEntity {
  String userId;
  String userType;
  String subscriptionType;
  String photo;
  String email;
  String password;
  String status;
  String firstname;
  String lastname;
  DateTime dateRegistered;
  DateTime updatedAt;

  UserEntity({
    this.userId = '',
    required this.userType,
    this.subscriptionType = SubscriptionTypes.Free,
    this.photo = '',
    required this.email,
    required this.password,
    this.status = UserStatus.Active,
    this.firstname = '',
    this.lastname = '',
    required this.dateRegistered,
    required this.updatedAt,
  });

  @override
  String toString() {
    return 'UserEntity{userId: $userId, userType: $userType, subscriptionType: $subscriptionType, photo: $photo, email: $email, password: $password, status: $status, firstname: $firstname, lastname: $lastname, dateRegistered: $dateRegistered, updatedAt: $updatedAt}';
  }

  factory UserEntity.copy(UserEntity userEntity) {
    return UserEntity(
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
