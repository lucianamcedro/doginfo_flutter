import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart' show rootBundle;
import 'package:doginfo/domain/models/dog_model.dart';

import './dogs_repository.dart';

class DogsRepositoryImpl implements DogsRepository {
  @override
  Future<List<DogModel>> getDogs() async {
    try {
      final jsonString = await rootBundle.loadString('assets/json/dogs.json');
      final jsonData = json.decode(jsonString) as List<dynamic>;

      final dogsList = jsonData.map((e) => DogModel.fromMap(e)).toList();

      return dogsList;
    } catch (e) {
      log('Erro ao buscar dados', error: e);
      throw Exception('Erro ao buscar dados');
    }
  }
}
