

import 'package:dartz/dartz.dart';
import 'package:surge_seven/core/error/app_error.dart';
import 'package:surge_seven/features/user/domain/user_entity.dart';
import 'package:surge_seven/features/user/domain/user_repository.dart';

class SignUpUserUseCase {
  final UserRepository _userRepository;

  SignUpUserUseCase(this._userRepository);

  Future<Either<AppError, UserEntity>> call(UserEntity userEntity) async {
    return await _userRepository.signUpUser(userEntity);
  }
}