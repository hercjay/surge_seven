import 'package:dartz/dartz.dart';
import 'package:surge_seven/features/user/domain/user_entity.dart';

import '../../../core/error/app_error.dart';

abstract class UserRepository {
  Future<Either<AppError, UserEntity>> getUser();

  Future<Either<AppError, UserEntity>> loginUser(UserEntity user);

  Future<Either<AppError, UserEntity>> signUpUser(
      UserEntity user);

  Future<Either<AppError, UserEntity>> getLocalUser();
}
