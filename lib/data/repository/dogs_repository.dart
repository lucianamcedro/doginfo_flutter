import 'package:doginfo/domain/models/dog_model.dart';

abstract class DogsRepository {
  Future<DogModel> getDogs();
}
