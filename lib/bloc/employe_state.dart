import 'package:new_test/model/create_model.dart';
import 'package:new_test/model/employ_model.dart';

abstract class EmployeState {
  const EmployeState();
  @override
  List<Object> get props => [];
}
class InitialState extends EmployeState{

}
class LoadingState extends EmployeState{}
class LoadedState extends EmployeState{
  final EmployeeDataModel employe;
  const LoadedState(this.employe);

}
class CreatedState extends EmployeState{
  final CreateModel create;
  const CreatedState(this.create);

}
class ErrorState extends EmployeState{
  final String msg;
  const ErrorState(this.msg);
  @override
  List<Object> get props => [msg];


}
class CreateEmployeeSuccess extends EmployeState {
  final CreateModel response;

  const CreateEmployeeSuccess({required this.response});

  // @override
  // List<Object?> get props => [response];
}

