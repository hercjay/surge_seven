

import 'package:dartz/dartz.dart';
import 'package:surge_seven/core/error/app_error.dart';
import 'package:surge_seven/features/user/domain/user_entity.dart';
import 'package:surge_seven/features/user/domain/user_repository.dart';

class GetLocalUserUseCase {
  final UserRepository userRepository;

  GetLocalUserUseCase(this.userRepository);

  Future<Either<AppError, UserEntity>> call() async {
    return await userRepository.getLocalUser();
  }
}