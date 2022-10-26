import 'package:doginfo/data/repository/dogs_repository.dart';
import 'package:doginfo/data/repository/dogs_repository_impl.dart';
import 'package:doginfo/data/usecases/dog_usecase.dart';
import 'package:doginfo/data/usecases/dog_usecase_impl.dart';
import 'package:get_it/get_it.dart';

class DependencyInjection {
  static initialize() {
    GetIt getIt = GetIt.instance;

    getIt.registerFactory<DogsRepository>(
      () => DogsRepositoryImpl(),
    );

    getIt.registerLazySingleton<DogUsecase>(
      () => DogUsecaseImpl(
        dogsRepository: getIt<DogsRepository>(),
      ),
    );
  }
}
