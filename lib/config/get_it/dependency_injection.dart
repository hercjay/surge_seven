import 'package:get_it/get_it.dart';
import 'package:surge_seven/features/truck/presentation/truck_provider.dart';
import 'package:surge_seven/features/truck/truck_repository.dart';
import 'package:surge_seven/features/user/domain/use_cases/get_local_user_use_case.dart';
import 'package:surge_seven/features/user/domain/use_cases/signup_user_use_case.dart';
import 'package:surge_seven/features/user/domain/user_repository.dart';
import 'package:surge_seven/features/user/presentation/user_provider.dart';

import '../../features/user/data/local_user_data_source.dart';
import '../../features/user/data/remote_user_data_source.dart';
import '../../features/user/data/user_repository_impl.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  //getIt.registerSingleton<UniversityRepository>(UniversityRepository());

  // Registering Data Sources
  getIt.registerLazySingleton<LocalUserDataSource>(() => LocalUserDataSource());

  // Register http.Client
  //getIt.registerLazySingleton<http.Client>(() => http.Client());

  getIt.registerLazySingleton<RemoteUserDataSource>(
      () => RemoteUserDataSource());

  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      localDataSource: getIt<LocalUserDataSource>(),
      remoteDataSource: getIt<RemoteUserDataSource>(),
    ),
  );

  getIt.registerLazySingleton<TruckRepository>(() => TruckRepository());

  // Registering Use Cases
  getIt.registerLazySingleton<GetLocalUserUseCase>(
      () => GetLocalUserUseCase(getIt<UserRepository>()));
  getIt.registerLazySingleton<SignUpUserUseCase>(
      () => SignUpUserUseCase(getIt<UserRepository>()));
  // getIt.registerLazySingleton<GetLocalUserUseCase>(
  //     () => GetLocalUserUseCase(getIt<UserRepository>()));
  // getIt.registerLazySingleton<UpdateUserUseCase>(
  //     () => UpdateUserUseCase(getIt<UserRepository>()));

  // Registering Providers
  getIt.registerLazySingleton<UserProvider>(() => UserProvider());
  getIt.registerLazySingleton<TruckProvider>(() => TruckProvider());
}
