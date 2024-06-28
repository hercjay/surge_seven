import 'package:flutter/material.dart';
import 'package:surge_seven/config/constants.dart';
import 'package:surge_seven/core/data/types.dart';
import 'package:surge_seven/features/user/domain/user_entity.dart';
import 'package:surge_seven/screens/admin_screens/admin_home_screen.dart';
import 'package:surge_seven/screens/client_screens/client_home_screen.dart';
import 'package:surge_seven/screens/truck_owner_screens/truck_owner_homescreen.dart';

UserEntity generateUserEntity() {
  UserEntity userEntity = UserEntity(
    userId: "1",
    userType: UserType.Client,
    subscriptionType: SubscriptionType.Free,
    photo: "",
    email: "email@gmail.com",
    password: "passwordHash",
    status: UserStatus.Active,
    username: "hercjay",
    firstname: "Hercjay",
    lastname: "Studios",
    dateRegistered: DateTime.now().toUtc(),
    updatedAt: DateTime.now().toUtc(),
  );
  return userEntity;
}

void navigateToHome(BuildContext context, UserEntity user) {
  switch (user.userType) {
    case UserType.Client:
      hercNavigationPushAndReplace(context, const ClientHomeScreen());
      break;
    case UserType.Admin:
      hercNavigationPushAndReplace(context, const AdminHomeScreen());
      break;
    case UserType.TruckOwner:
      hercNavigationPushAndReplace(context, const TruckOwnerHomeScreen());
      break;
    default:
      hercNavigationPushAndReplace(context, const ClientHomeScreen());
  }
}
