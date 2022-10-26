import 'package:doginfo/domain/models/dog_model.dart';

abstract class DogsRepository {
  Future<List<DogModel>> getDogs();
}
