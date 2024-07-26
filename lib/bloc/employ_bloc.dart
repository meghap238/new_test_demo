import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_test/bloc/employe_state.dart';
import 'package:new_test/repository/api_repository.dart';

import '../repository_one.dart';
import 'employe_event.dart';

class EmployBloc extends Bloc<EmployeEvent, EmployeState>{
  final ApiIntegrationProvider empRepo;
  EmployBloc(this.empRepo) :super(InitialState()){
final ApiRepository _apiRepo = ApiRepository();
on<EmployeEvent>((event, emit) {
});
on<GetListEmploye>((event, emit) async {
  emit(LoadingState());
  try {
    final users = await empRepo.fetchdata();
    emit((LoadedState(users!)));
  } catch (e) {

    emit(ErrorState(e.toString()));
  }
});
on<CreateEmployeeButtonPressed>((event, emit) async {
  emit(LoadingState());
  try {

    final response = await empRepo.creatData(event.name, event.salary, event.age);

    emit(CreateEmployeeSuccess( response: response!));


  } catch (e) {
    emit(ErrorState(e.toString()));
  }
});

}
}