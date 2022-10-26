import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:doginfo/domain/models/dog_model.dart';
import 'package:doginfo/domain/shared/const.dart';

import './dogs_repository.dart';

class DogsRepositoryImpl implements DogsRepository {
  @override
  Future<DogModel> getDogs() async {
    try {
      final result = await Dio().get(ApiConsts.baseUrl);
      return DogModel.fromMap(result.data);
    } on DioError catch (e) {
      log('Erro ao buscar dados', error: e);
      throw Exception('Erro ao buscar dados');
    }
  }
}
