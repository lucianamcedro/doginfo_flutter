import 'package:dio/dio.dart';
import 'package:doginfo/data/usecases/dog_usecase.dart';
import 'package:doginfo/domain/models/dog_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dogs_event.dart';
part 'dogs_state.dart';

class DogsBloc extends Bloc<DogsEvent, DogsState> {
  final DogUsecase dogUsecase;

  DogsBloc({required this.dogUsecase}) : super(DogsInitial()) {
    on<DogsEvent>((event, emit) async {
      if (event is OnGetDogs) {
        try {
          final List<DogModel> dogModel;

          final dogs = await dogUsecase.getDogs();
          dogModel = dogs;
          emit(DogsSuccess(dogModel: dogModel));
        } on DioError catch (error) {
          emit(DogsFailed(error: error.message));
        }
      }
    });
  }
}
