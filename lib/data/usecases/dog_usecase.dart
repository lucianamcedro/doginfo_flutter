import 'package:doginfo/domain/models/dog_model.dart';

abstract class DogUsecase {
  Future<List<DogModel>> getDogs();
}
