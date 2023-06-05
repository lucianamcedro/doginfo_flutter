import 'package:doginfo/data/repository/repository.dart';
import 'package:doginfo/domain/models/dog_model.dart';

import './dog_usecase.dart';

class DogUsecaseImpl implements DogUsecase {
  final DogsRepository dogsRepository;
  DogUsecaseImpl({
    required this.dogsRepository,
  });

  @override
  Future<List<DogModel>> getDogs() {
    return dogsRepository.getDogs();
  }
}
