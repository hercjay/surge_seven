import 'package:dartz/dartz.dart';
import 'package:surge_seven/core/data/truck/truck_model.dart';
import 'package:surge_seven/core/data/truck/truck_provider.dart';
import 'package:surge_seven/core/error/app_error.dart';
import 'package:surge_seven/features/user/domain/user_entity.dart';

class TruckRepository {
  final TruckProvider _truckProvider = TruckProvider();

  Future<Either<AppError, List<TruckEntity>>> getAllTrucks() async {
    final allTrucks = await _truckProvider.getAllTrucks();
    return allTrucks.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  Future<Either<AppError, UserEntity>> getTruckOwner(String ownerId) async {
    final truckOwner = await _truckProvider.getTruckOwner(ownerId);
    return truckOwner.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
