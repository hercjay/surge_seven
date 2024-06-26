import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:surge_seven/config/constants.dart';
import 'package:surge_seven/features/user/data/user_model.dart';
import 'package:surge_seven/features/user/data/user_util.dart';
import 'package:surge_seven/features/user/domain/user_entity.dart';
import '../../../core/error/app_error.dart'; // Import your UserModel here

class RemoteUserDataSource {
  //final http.Client httpClient;
  //RemoteUserDataSource(this.httpClient);

  RemoteUserDataSource() {
    _initRemoteDb();
  }

  Future<void> _initRemoteDb() async {}

  Future<Either<AppError, UserEntity>> fetchUser(String id) async {
    try {
      //final response =await httpClient.get(Uri.parse('$usersUrl/get_user.php?id=$id'));
      //perform mysql query to get user data
      return Right(generateUserEntity());
    } catch (e, stackTrace) {
      return Left(AppError(e.toString(),
          errorKey: e.toString(), stackTrace: stackTrace));
    }

    //   if (response.statusCode == 200) {
    //     dPrint( "user data fetched successfully ${response.statusCode} : ${response.body}");

    //     final userModel = UserModel.fromJson(
    //         json.decode(response.body) as Map<String, dynamic>);
    //     return Right(userModel); // Cast the UserModel to UserEntity
    //   } else {
    //     dPrint(
    //         "response: ${response.statusCode} : ${json.decode(response.body)['error']}");

    //     return Left(AppError(json.decode(response.body)['error']));
    //   }
    // } catch (e) {
    //   if (e is http.Response) {
    //     dPrint("Error fetching user data 1: ${e.statusCode} - ${e.body}");
    //     return Left(AppError(e.body, statusCode: e.statusCode));
    //   } else if (e is http.ClientException) {
    //     dPrint("Error fetching user data 2: $e");
    //     return Left(AppError(e.message, statusCode: 400));
    //   } else if (e is FormatException) {
    //     dPrint("Error fetching user data 3: $e");
    //     return Left(AppError(e.message,
    //         statusCode: 400, errorKey: ErrorKeys.UNEXPECTED_CHAR));
    //   } else {
    //     dPrint("Error fetching user data X: $e");
    //     return Left(AppError(e.toString(), statusCode: 500));
    //   }
    // }
  }

  Future<Either<AppError, UserEntity>> addUser(UserEntity userEntity) async {
    try {
      //convert entity to model so that you can use toJson() method
      UserModel userModel = UserModel.fromEntity(userEntity);
      return Right(userEntity);

      // final response = await httpClient.post(
      //     Uri.parse('$usersUrl/add_user.php'),
      //     body: json.encode(userModel.toJson()));
      // if (response.statusCode == 200) {
      //   final userModel = UserModel.fromJson(
      //       json.decode(response.body) as Map<String, dynamic>);
      //   return Right(userModel); // Cast the UserModel to UserEntity
      // } else {
      //   dPrint(
      //       "error adding user... response code not 200: ${response.statusCode} - ${response.body}");
      //   return Left(AppError('error_adding_user_data'.tr()));
      // }
    } catch (e, stackTrace) {
      // if (e is http.Response) {
      //   dPrint(
      //       "error_inserting_user_remote E IS HTTP RESP: ${e.statusCode} - ${e.body}");
      //   return Left(AppError(e.body, stackTrace: stackTrace));
      // } else {
      //   if (kDebugMode) {
      //     print("error_inserting_user_remote EE: $e");
      //   }
      //   return Left(AppError(e.toString(), stackTrace: stackTrace));
      // }
      return Left(AppError(e.toString(), stackTrace: stackTrace));
    }
  }

  Future<Either<AppError, UserEntity>> updateUser(
      UserEntity userEntity, List<String>? fields) async {
    return Right(userEntity);
  }

// Implement other methods...
}
