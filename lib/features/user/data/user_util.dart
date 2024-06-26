import 'package:surge_seven/core/data/types.dart';
import 'package:surge_seven/features/user/domain/user_entity.dart';

UserEntity generateUserEntity() {
  UserEntity userEntity = UserEntity(
    userId: "1",
    userType: UserTypes.Client,
    subscriptionType: SubscriptionTypes.Free,
    photo: "",
    email: "email@gmail.com",
    password: "passwordHash",
    status: UserStatus.Active,
    firstname: "Hercjay",
    lastname: "Studios",
    dateRegistered: DateTime.now().toUtc(),
    updatedAt: DateTime.now().toUtc(),
  );
  return userEntity;
}
