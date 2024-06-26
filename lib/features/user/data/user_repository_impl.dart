import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:surge_seven/config/constants.dart';
import 'package:surge_seven/core/data/types.dart';
import 'package:surge_seven/core/error/app_error.dart';
import 'package:surge_seven/core/utils/connectivity_util/connectivity_util.dart';
import 'package:surge_seven/features/user/data/local_user_data_source.dart';
import 'package:surge_seven/features/user/data/remote_user_data_source.dart';
import 'package:surge_seven/features/user/data/user_util.dart';
import 'package:surge_seven/features/user/domain/user_entity.dart';
import 'package:surge_seven/features/user/domain/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final LocalUserDataSource localDataSource;
  final RemoteUserDataSource remoteDataSource;

  UserRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<AppError, UserEntity>> getUser() async {
    //check for local data
    //if null, redirect to signup
    UserEntity userEntity =
        generateUserEntity(); //TODO: replace with actual user
    return Right(userEntity);
  }

  // @override
  // Future<Either<AppError, UserEntity>> updateUser(
  //     UserEntity user, List<String>? params) async {
  //   dPrint(
  //       'inside updateUser on repo impl, school id is ${user.schoolId} and params is $params');
  //   try {
  //     if (await ConnectivityUtil.hasInternet()) {
  //       dPrint("HAS internet: attempt to update remote user data");
  //       final remoteUpdateUserEither =
  //           await remoteDataSource.updateUser(user, params);
  //       return remoteUpdateUserEither.fold(
  //         (error) async {
  //           if (error.errorKey == ErrorKeys.ERROR_OPENING_REMOTE_DB) {
  //             //user has internet but probably no active data bundle
  //             dPrint("POOR internet: attempt to update local user data");
  //             final result = await localDataSource.saveLocal(user);
  //             return result.fold((error) {
  //               return Left(error);
  //             }, (userEntity) {
  //               showToast('data_stored_only_locally'.tr());
  //               return Future.delayed(const Duration(seconds: 3), (() {
  //                 return Right(userEntity);
  //               }));
  //             });
  //           }
  //           return Left(error);
  //         },
  //         (remoteUser) async {
  //           // Cache the remote user data locally
  //           await localDataSource.saveLocal(user);
  //           return Right(user);
  //         },
  //       );
  //     } else {
  //       dPrint("no internet: attempt to update local user data");
  //       final result = await localDataSource.saveLocal(user);
  //       return result.fold((error) {
  //         return Left(error);
  //       }, (userEntity) {
  //         showToast('data_stored_only_locally'.tr());
  //         return Future.delayed(const Duration(seconds: 3), (() {
  //           return Right(userEntity);
  //         }));
  //       });
  //       // final error = AppError('no_internet_and_no_local_data'.tr(),
  //       //     timestamp: DateTime.now());
  //     }
  //   } catch (e, stackTrace) {
  //     final error = AppError('${'error_updating_user'.tr()} : $e',
  //         stackTrace: stackTrace, timestamp: DateTime.now());
  //     return Left(error);
  //   }
  // }

  @override
  Future<Either<AppError, UserEntity>> getLocalUser() {
    return localDataSource.getUser();
  }

  @override
  Future<Either<AppError, UserEntity>> loginUser(UserEntity user) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, UserEntity>> signUpUser(UserEntity userEntity) async {
    //send user data to API
    //if successful, save user data locally
    //if not successful, return error
    return Right(userEntity);
  }
}
