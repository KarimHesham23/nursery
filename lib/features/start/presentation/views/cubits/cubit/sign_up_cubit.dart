import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:nursery_app/core/models/patient.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial()) {
    _loadPatients();
  }
  final SharedPreferences prefs = GetIt.instance<SharedPreferences>();

  List<Patient> patients = [];

  Future<void> addUser(Patient newPatient) async {
    emit(SignUpLoading());
    try {
      for (var patient in patients) {
        if (patient.email == newPatient.email) {
          await Future.delayed(Duration(seconds: 2));
          emit(SignUpFaileur(errorMessage: "Email already exists"));
          return;
        }
      }
      patients.add(newPatient);
      await _savePatients();
      await Future.delayed(Duration(seconds: 3));
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFaileur(errorMessage: e.toString()));
    }
  }

  Future<void> _savePatients() async {
    List<String> patientsJson =
        patients.map((patient) => jsonEncode(patient.toJson())).toList();
    await prefs.setStringList('patients', patientsJson);
  }

  Future<void> _loadPatients() async {
    List<String>? patientsJson = prefs.getStringList('patients');
    if (patientsJson != null) {
      patients = patientsJson
          .map((patientJson) => Patient.fromJson(jsonDecode(patientJson)))
          .toList();
    }
  }
}
