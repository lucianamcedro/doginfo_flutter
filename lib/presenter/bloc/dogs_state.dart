part of 'dogs_bloc.dart';

abstract class DogsState {}

class DogsInitial extends DogsState {}

class DogsSuccess extends DogsState {
  final List<DogModel> dogModel;

  DogsSuccess({
    required this.dogModel,
  });
}

class DogsFailed extends DogsState {
  final String error;
  DogsFailed({
    required this.error,
  });
}
