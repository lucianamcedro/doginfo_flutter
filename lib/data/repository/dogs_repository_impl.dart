import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:doginfo/domain/models/dog_model.dart';
import 'package:doginfo/domain/shared/const.dart';

import './dogs_repository.dart';

class DogsRepositoryImpl implements DogsRepository {
  @override
  Future<List<DogModel>> getDogs() async {
    try {
      dynamic result;
      result = await Dio().get(ApiConsts.baseUrl);
      final dados = result.data as List;

      final dogsMapsList = dados.map((e) => DogModel.fromMap(e)).toList();

      return dogsMapsList;
    } on DioError catch (e) {
      log('Erro ao buscar dados', error: e);
      throw Exception('Erro ao buscar dados');
    }
  }
}
