import 'package:doginfo/data/repository/repository.dart';
import 'package:doginfo/data/usecases/usecase.dart';
import 'package:doginfo/presenter/bloc/bloc/dogs_bloc.dart';
import 'package:get_it/get_it.dart';

class DependencyInjection {
  static initialize() {
    final GetIt getIt = GetIt.instance;

    getIt.registerFactory<DogsRepository>(
      () => DogsRepositoryImpl(),
    );

    getIt.registerLazySingleton<DogUsecase>(
      () => DogUsecaseImpl(
        dogsRepository: getIt<DogsRepository>(),
      ),
    );

    getIt.registerFactory<DogsBloc>(
      () => DogsBloc(
        dogUsecase: getIt<DogUsecase>(),
      ),
    );
  }
}
