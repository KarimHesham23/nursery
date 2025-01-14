import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nursery_app/core/models/patient.dart';

part 'predict_state.dart';

class PredictCubit extends Cubit<PredictState> {
  PredictCubit() : super(PredictInitial());

  int currentuser = -1;

  Future<void> checkUserCredentials(
      String email, String password, List<Patient> patients) async {
    bool check = false;
    emit(PredictLoading());
    await Future.delayed(Duration(seconds: 3));
    for (int i = 0; i < patients.length; i++) {
      if (patients[i].email == email && patients[i].password == password) {
        emit(PredictSuccess());
        check = true;
        currentuser = i;
      }
    }
    if (!check) {
      emit(PredictFaileur(errorMessage: "Email or password is incorrect"));
    }
  }
}
