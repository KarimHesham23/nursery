import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nursery_app/constants.dart';
import 'package:nursery_app/core/helpers/api.dart';
import 'package:nursery_app/core/models/readings.dart';

part 'fetch_state.dart';

class FetchCubit extends Cubit<FetchState> {
  FetchCubit() : super(FetchInitial());
  Future<void> fetchReadings() async {
    emit(FetchLoading());
    try {
      Map<String, dynamic> result = await Api().get(url: kUrl);
      emit(FetchSuccess(readings: Readings.fromJson(result)));
    } catch (e) {
      emit(FetchFaileur(errorMessage: e.toString()));
    }
  }
}
