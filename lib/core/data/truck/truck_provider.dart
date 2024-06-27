import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:surge_seven/core/data/truck/truck_model.dart';
import 'package:surge_seven/core/error/app_error.dart';
import 'package:surge_seven/features/user/data/user_util.dart';
import 'package:surge_seven/features/user/domain/user_entity.dart';

class TruckProvider extends ChangeNotifier {
  List<TruckEntity> _allTrucks = [];
  List<TruckEntity> get allTrucks => _allTrucks;

  Future<Either<AppError, List<TruckEntity>>> getAllTrucks() async {
    try {
      //TODO: get all trucks from the database and assign to _trucks then return Right(_trucks)
      return Right(_allTrucks);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }

  Future<Either<AppError, UserEntity>> getTruckOwner(String ownerId) async {
    try {
      //TODO: get truck owner from the database and assign to _truckOwner then return Right(_truckOwner)
      return Right(generateUserEntity());
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }

  
}
