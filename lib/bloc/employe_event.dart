import 'package:new_test/model/create_model.dart';

abstract class EmployeEvent{
  const EmployeEvent();
  @override
  List<Object> get props => [];
}
class GetListEmploye extends EmployeEvent {

}
class CreateEmployeeButtonPressed extends EmployeEvent {
   final String name;
  final String salary;
  final String age;

  const CreateEmployeeButtonPressed({
    required this.name,
    required this.salary,
    required this.age,
  });

  // @override
  // List<Object?> get props => [name, salary, age];
}