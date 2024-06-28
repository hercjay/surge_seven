import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:surge_seven/features/truck/truck.dart';
import 'package:surge_seven/core/error/app_error.dart';
import 'package:surge_seven/features/user/data/user_util.dart';
import 'package:surge_seven/features/user/domain/user_entity.dart';

class TruckProvider extends ChangeNotifier {
  List<Truck> _allTrucks = [];
  List<Truck> get allTrucks => _allTrucks;

  Future<Either<AppError, List<Truck>>> getAllTrucks() async {
    try {
      //TODO: get all trucks from the database and assign to _trucks then return Right(_trucks)
      _allTrucks = trucksDemoList;
      return Right(_allTrucks);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }

  Future<Either<AppError, UserEntity>> getTruckOwner(
      String ownerUsername) async {
    try {
      //TODO: get truck owner from the database and assign to _truckOwner then return Right(_truckOwner)
      return Right(generateUserEntity());
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }
}
