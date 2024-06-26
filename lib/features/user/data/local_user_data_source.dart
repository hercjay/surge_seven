import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:surge_seven/config/get_it/dependency_injection.dart';
import 'package:surge_seven/features/user/data/remote_user_data_source.dart';
import 'package:surge_seven/features/user/data/user_util.dart';
import 'package:surge_seven/features/user/domain/user_entity.dart';

import '../../../core/error/app_error.dart';

class UserDAO {
  Future<void> insertUser(UserEntity user) async {}

  Future<Either<AppError, UserEntity>> getUser() async {
    return Left(AppError('No local user data found'));
  }

// Implement other CRUD methods...
}

class LocalUserDataSource {
  final remoteUserDataSource = getIt<RemoteUserDataSource>();

  LocalUserDataSource();

  Future<Either<AppError, UserEntity>> getUser() async {
    //get user from local storage or return error
    //return Right(generateUserEntity());
    return Left(AppError('No local user data found'));
  }

  Future<Either<AppError, UserEntity>> saveLocal(UserEntity user) async {
    try {
      //await userDAO.insertUser(user);
      return Right(user);
    } catch (e) {
      return Left(AppError('Failed to save user records to the local database',
          errorKey: e.toString()));
    }
  }

// Implement other methods...
}
