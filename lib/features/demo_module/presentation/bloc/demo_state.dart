part of 'demo_bloc.dart';

@immutable
abstract class DemoState {}

class DemoInitial extends DemoState {}

class OnClickState extends DemoState {
  final int count;

  OnClickState({required this.count});
}

class ErrorState extends DemoState {
  final String message;
  bool isHandled = false;

  ErrorState(this.message);
}

class FetchEmployeesState extends DemoState {
  final List<EmployeeDatamodel> employeeList;

  FetchEmployeesState({required this.employeeList});
}
